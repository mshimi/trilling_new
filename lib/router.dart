import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:trilling_web/features/auth/domain/repositries/auth_repo.dart';
import 'package:trilling_web/features/auth/presentation/home_page.dart';
import 'package:trilling_web/features/auth/presentation/login_page.dart';
import 'package:trilling_web/injection.dart';

BeamerDelegate routerDelegate = BeamerDelegate(
    guards: <BeamGuard>[
      authGuard,
      unauthGuard
    ],
    locationBuilder: RoutesLocationBuilder(routes: {
      '/': (context, state, object) {
        return HomePage();
      },
      '/login': (context, state, object) {
        return LoginPage();
      }
    }));

BeamGuard unauthGuard = BeamGuard(
  guardNonMatching: false,
  pathPatterns: ['/'],
  check: (context, location) => sl<Auth_Repo>().isAuthenticated(),
  replaceCurrentStack: false,
  beamToNamed: ((origin, target) => '/login'),
);

BeamGuard authGuard = BeamGuard(
  guardNonMatching: false,
  pathPatterns: ['/login'],
  check: (context, location) => !sl<Auth_Repo>().isAuthenticated(),
  replaceCurrentStack: false,
  beamToNamed: ((origin, target) => '/'),
);
