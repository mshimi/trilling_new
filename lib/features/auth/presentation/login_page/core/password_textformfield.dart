import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/features/auth/presentation/login_page/bloc/auth_bloc/auth_bloc.dart';
import 'package:trilling_web/features/auth/presentation/login_page/core/login_textformfield.dart';
import 'package:trilling_web/injection.dart';

class PasswordTextForm extends StatefulWidget {
  const PasswordTextForm({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextForm> createState() => _PasswordTextFormState();
}

class _PasswordTextFormState extends State<PasswordTextForm> {
  bool isvisable = true;

  @override
  Widget build(BuildContext context) {
    AuthBloc authbloc = AuthBloc.get(context);
    return LoginTextFormField(
      labelText: 'Passwort',
      prefixIcon: Icons.lock,
      controller: authbloc.passwordController,
      obscureText: isvisable,
      suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isvisable = !isvisable;
              
            });
          },
          icon: Icon(
            suffixIconData(isvisable),
            color: Colors.blueGrey,
          )),
    );
  }

  IconData suffixIconData(bool isvisable) {
    if (isvisable) {
      return Icons.visibility;
    } else {
      return Icons.visibility_off;
    }
  }
}
