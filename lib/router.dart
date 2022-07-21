import 'dart:html';
import 'dart:js';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:trilling_web/features/auth/presentation/home_page.dart';
import 'package:trilling_web/features/auth/presentation/login_page.dart';

BeamerDelegate routerDelegate = BeamerDelegate(
    guards: <BeamGuard>[
      authGuard,
    ],
    locationBuilder: RoutesLocationBuilder(routes: {
      '/': (context, state, object) {
        return HomePage();
      },
      '/login': (context, state, object) {
        return LoginPage();
      }
    }));

BeamGuard authGuard = BeamGuard(
  guardNonMatching: false,
  pathPatterns: ['/'],
  check: (context, location) => false,
  beamToNamed: ((origin, target) => '/login'),
);
