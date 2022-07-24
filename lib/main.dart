import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:trilling_web/bloc_observer.dart';
import 'package:trilling_web/features/auth/domain/entities/appuser.dart';
import 'package:trilling_web/features/auth/domain/repositries/auth_repo.dart';
import 'package:trilling_web/features/auth/infrastructure/repositries/auth_imp.dart';
import 'package:trilling_web/features/auth/presentation/home_page/home_page.dart';
import 'package:trilling_web/features/auth/presentation/login_page/login_page.dart';
import 'package:trilling_web/injection.dart';
import 'package:trilling_web/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trilling_web/theme.dart';
import 'firebase_options.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await init();

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sl.get<Auth_Repo>().isAuthenticated();

    final GoRouter _router = GoRouter(
      redirectLimit: 100,
      initialLocation: '/',
      redirect: (state) {
        final loggedIn = sl.get<Auth_Repo>().isAuthenticated();
        final loggingIn = state.location == '/login';

        if (!loggedIn) return loggingIn ? null : '/login';

        if (loggingIn && loggedIn) return '/';

        return null;
      },
      routes: <GoRoute>[
        GoRoute(
          path: '/login',
          builder: (BuildContext context, GoRouterState state) => LoginPage(),
        ),
        GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) {
              print(state.subloc);
              return HomePage(
                appUser: sl.get<Auth_Repo>().currentAppUser(),
              );
            }),
      ],
    );

    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.autoScale(500, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(color: Colors.white),
      ),
    );
  }
}
