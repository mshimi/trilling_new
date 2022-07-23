import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/failures/auth_failure.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/features/auth/domain/entities/appuser.dart';
import 'package:trilling_web/features/auth/infrastructure/model/appUserModel.dart';

abstract class AdminControll_Repo {
  Future<Either<AuthFailure, Unit>> addUser(AppUser appUser);
  Future<Either<StoreFailure, Unit>> deleteUser(AppUser appUser);
  updateUser(AppUserModel appUserModel);
  Future<Either<StoreFailure, List<AppUser>>> getAllUsers();

 
}
