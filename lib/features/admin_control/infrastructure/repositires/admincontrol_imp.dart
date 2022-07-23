import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trilling_web/core/failures/auth_failure.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/core/firesore.dart';
import 'package:trilling_web/features/admin_control/domain/repositires/admincontrol_repo.dart';
import 'package:trilling_web/features/auth/domain/entities/appuser.dart';
import 'package:trilling_web/features/auth/infrastructure/model/appUserModel.dart';

class AdminControll_Imp implements AdminControll_Repo {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AdminControll_Imp({required this.firebaseAuth, required this.firestore});

  @override
  Future<Either<AuthFailure, Unit>> addUser(AppUser appUser) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: appUser.email, password: appUser.password);

      await firestore
          .collection(appUserCollection)
          .doc(userCredential.user!.uid)
          .set(AppUserModel.fromDomain(appUser)
              .copyWith(id: userCredential.user!.uid)
              .toMap());

      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(WeekPasswordFailure());
      } else if (e.code == 'email-already-in-use') {
        return left(EmailAlreadyInUseFailure());
      } else if (e.code == 'invalid-email') {
        return left(InvalidEmailFailure());
      } else {
        return left(InvalidEmailAndPasswordCombinationFailure());
      }
    }
  }

  @override
  Future<Either<StoreFailure, Unit>> deleteUser(AppUser appUser) async {
    try {
      await firestore.collection(appUserCollection).doc(appUser.id).update(
          AppUserModel.fromDomain(appUser).copyWith(isDeleted: true).toMap());

      return const Right(unit);
    } catch (e) {
      return Left(DocumentNotExistsFailure());
    }
  }

  @override
  Future<Either<StoreFailure, List<AppUser>>> getAllUsers() async {
    List<AppUser> appUserList = [];
    try {
      firestore.collection(appUserCollection).get().then((value) {
        value.docs.forEach((element) {
          AppUser appUser = AppUserModel.fromFirebase(element).toDomain();
          appUserList.add(appUser);
        });
      });
      return Right(appUserList);
    } catch (e) {
      return Left(DocumentNotExistsFailure());
    }
  }

  @override
 Future<Either<StoreFailure, Unit>> updateUser(AppUserModel appUserModel) async {
    try {
      await firestore
          .collection(appUserCollection)
          .doc(appUserModel.id)
          .update(appUserModel.toMap());

      return Right(unit);
    } catch (e) {
      return Left(DocumentNotExistsFailure());
    }
  }
}
