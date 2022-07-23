abstract class AuthFailure {}

class ServerFailure extends AuthFailure {}

class EmailAlreadyInUseFailure extends AuthFailure {}

class InvalidEmailFailure extends AuthFailure {}

class WeekPasswordFailure extends AuthFailure{}

class InvalidEmailAndPasswordCombinationFailure extends AuthFailure {}