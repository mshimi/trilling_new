import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/features/auth/domain/entities/appuser.dart';
import 'package:trilling_web/features/auth/domain/repositries/auth_repo.dart';
import 'package:trilling_web/injection.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Auth_Repo auth_repo;
  AppUser? appUser;
  AuthBloc({required this.auth_repo}) : super(AuthInitial()) {
    on<LoginButtonClicked>((event, emit) async {
      isLoading = true;
      emit(LoadingState(isLoading: isLoading));

      add(EmailAndPasswrdValidated(
          email: event.email, password: event.password));
    });

    on<EmailAndPasswrdValidated>((event, emit) {
      bool isEmailValidate = false;
      bool isPasswordValidate = false;

      String? emailerrormessage;

      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(event.email)) {
        isEmailValidate = true;
      } else {
        emailerrormessage = 'ungültige Email';
      }
      if (event.password.length >= 6) {
        isPasswordValidate = true;
      }

      emit(InputValidateState(
          isEmailValidate: isEmailValidate,
          isPasswordValidate: isPasswordValidate));

      if (isPasswordValidate && isEmailValidate) {
        add(LoginProccedEvent(email: event.email, password: event.password));
      } else {
        isLoading = false;
      }
    });

    on<LoginProccedEvent>((event, emit) async {
      var signin =
          await auth_repo.signIn(email: event.email, password: event.password);

      signin.fold(
        (left) {
          isLoading = false;
          emit(LoginFailureState(failureMessage: ''));
        },
        (appUser)  {
          isLoading = false;

       
            emit(LoginSucssesState(appUser: appUser));
      
        },
      );
    });
  }

  static AuthBloc get(context) => BlocProvider.of(context);

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
}
