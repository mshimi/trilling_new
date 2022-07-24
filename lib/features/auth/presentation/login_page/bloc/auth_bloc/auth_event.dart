part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonClicked extends AuthEvent {
  String email;
  String password;

  LoginButtonClicked({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class EmailAndPasswrdValidated extends AuthEvent {
  String email;
  String password;

  EmailAndPasswrdValidated({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginProccedEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginProccedEvent({required this.email,required this.password});
    @override
  List<Object> get props => [email, password];
}
