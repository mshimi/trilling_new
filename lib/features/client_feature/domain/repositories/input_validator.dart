import 'package:dartz/dartz.dart';

abstract class InputValidatorRepository {
  Either<String, Unit> validateEmail({ String? email});
  Either<String, Unit> validatePassword({required String Password});

  Either<String, Unit> validateZipCode({required String zipCode});

  Either<String, Unit> validateName({required String Name});
}
