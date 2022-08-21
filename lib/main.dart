import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:trilling_web/bloc_observer.dart';
import 'package:trilling_web/features/auth/domain/repositries/auth_repo.dart';

import 'package:trilling_web/injection.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:trilling_web/myapp.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await init();

  await sl
      .get<Auth_Repo>()
      .signIn(email: 'm.shimi@outlook.com', password: 'shimi1992');

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
