import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/features/auth/presentation/login_page/bloc/auth_bloc/auth_bloc.dart';

import '../../../../../core/presentation/widgets/custom_elevated_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = AuthBloc.get(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return CustomElevatedButton(
          text: 'Einloggen',
          onpressed: () {
            authBloc.add(LoginButtonClicked(
                email: authBloc.emailController.text,
                password: authBloc.passwordController.text));
          },
          isLoading: authBloc.isLoading,
        );
      },
    );
  }
}
