import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/core/firesore.dart';
import 'package:trilling_web/features/auth/domain/entities/appuser.dart';
import 'package:trilling_web/core/failures/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:trilling_web/features/auth/domain/repositries/auth_repo.dart';
import 'package:trilling_web/features/auth/infrastructure/model/appUserModel.dart';

class Auth_Imp implements Auth_Repo {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  Auth_Imp({required this.firebaseAuth, required this.firebaseFirestore});

  @override
  Future<Either<AuthFailure, AppUser>> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      String uid = userCredential.user!.uid;

      DocumentSnapshot<Map<String, dynamic>> userData =
          await firebaseFirestore.collection(appUserCollection).doc(uid).get();

      AppUser appUser = AppUserModel.fromFirebase(userData).toDomain();
      return right(appUser);
    } on FirebaseAuthException catch (_) {
      return left(InvalidEmailAndPasswordCombinationFailure());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      firebaseAuth.signOut();
      return const Right(unit);
    } on FirebaseAuthException catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> changeUserPassword(
      AppUser appUser, String newPassword) async {
    try {
      await firebaseAuth.currentUser!.updatePassword(newPassword);

      await firebaseFirestore
          .collection(appUserCollection)
          .doc(appUser.id)
          .update(AppUserModel.fromDomain(appUser)
              .copyWith(password: newPassword)
              .toMap());

      return Right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(WeekPasswordFailure());
      } else {
        return left(InvalidEmailAndPasswordCombinationFailure());
      }
    } catch (e) {
      print(e);
     return left(InvalidEmailAndPasswordCombinationFailure());
    }
  }

  @override
  bool isAuthenticated() {
    User? user = firebaseAuth.currentUser;

    if (user == null) {
      return false;
    } else {
      return true;
    }
  }
}
