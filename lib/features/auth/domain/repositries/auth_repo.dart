import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trilling_web/core/failures/auth_failure.dart';
import 'package:trilling_web/features/auth/domain/entities/appuser.dart';

abstract class Auth_Repo {
  Future<Either<AuthFailure, AppUser>> signIn(
      {required String email, required String password});

  Future<Either<AuthFailure, Unit>> signOut();

  Future<Either<AuthFailure, Unit>> changeUserPassword(
      AppUser appUser, String newPassword);

  bool isAuthenticated();

  AppUser? currentAppUser();
}
