part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoadingState extends AuthState {
  final bool isLoading;
  const LoadingState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class LoginSucssesState extends AuthState {
  final AppUser appUser;

  const LoginSucssesState({required this.appUser});

  @override
  List<Object> get props => [appUser];
}

class LoginFailureState extends AuthState {
  final String failureMessage;

  const LoginFailureState({required this.failureMessage});

  @override
  List<Object> get props => [failureMessage];
}

class InputValidateState extends AuthState {
  final bool isEmailValidate;
  final bool isPasswordValidate;
 final String? emailErrorMessage;

  const InputValidateState(
      {required this.isEmailValidate, required this.isPasswordValidate, this.emailErrorMessage});

  @override
  List<Object> get props => [isPasswordValidate, isEmailValidate];
}
