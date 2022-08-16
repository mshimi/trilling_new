import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/utils/strings.dart';
import 'package:trilling_web/features/client_feature/domain/repositories/input_validator.dart';

class InputValidatorImp implements InputValidatorRepository {
  @override
  Either<String, Unit> validateEmail({String? email}) {
    if (email == null) {
      return const Right(unit);
    } else if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return const Right(unit);
    } else {
      return const Left(unvalidEmailInputMessage);
    }
  }

  @override
  Either<String, Unit> validateName({required String name}) {
    // TODO: implement validateName
    throw UnimplementedError();
  }

  @override
  Either<String, Unit> validatePassword({required String password}) {
    // TODO: implement validatePassword
    throw UnimplementedError();
  }

  @override
  Either<String, Unit> validateZipCode({required String zipCode}) {
    // TODO: implement validateZipCode
    throw UnimplementedError();
  }
}
