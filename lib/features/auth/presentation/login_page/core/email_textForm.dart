import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/features/auth/presentation/login_page/bloc/auth_bloc/auth_bloc.dart';
import 'package:trilling_web/features/auth/presentation/login_page/core/login_textformfield.dart';

class EmailTextForm extends StatelessWidget {
  const EmailTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = AuthBloc.get(context);

    return LoginTextFormField(
      labelText: 'Email',
      prefixIcon: Icons.email,
      controller: authBloc.emailController,
    );
  }
}
