import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';

import 'package:trilling_web/features/auth/presentation/login_page/bloc/auth_bloc/auth_bloc.dart';
import 'package:trilling_web/features/auth/presentation/login_page/core/email_textForm.dart';
import 'package:trilling_web/features/auth/presentation/login_page/core/login_button.dart';
import 'package:trilling_web/features/auth/presentation/login_page/core/logo.dart';
import 'package:trilling_web/features/auth/presentation/login_page/core/password_textformfield.dart';
import 'package:trilling_web/features/auth/presentation/login_page/core/text_anmelden.dart';
import 'package:trilling_web/injection.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = context.getWidth();
    // ignore: unused_local_variable
    double height = context.getHeight();

    var responsiveWrapper = ResponsiveWrapper.of(context);

    return BlocProvider(
      create: (context) => sl.get<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is LoginSucssesState) {
            context.replace(
              '/',
              extra: state.appUser,
            );
          }
        },
        child: Scaffold(
          body: responsiveWrapper.isLargerThan(MOBILE)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Logo(),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          TextAnmelden(
                            maxWidth: 500,
                            alignment: Alignment.centerLeft,
                          ),
                          EmailTextForm(),
                          PasswordTextForm(),
                          LoginButton(),
                        ],
                      ),
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Logo(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          TextAnmelden(),
                          EmailTextForm(),
                          PasswordTextForm(),
                          LoginButton(),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
