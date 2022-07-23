import 'package:beamer/beamer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:trilling_web/bloc_observer.dart';
import 'package:trilling_web/injection.dart';
import 'package:trilling_web/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trilling_web/theme.dart';
import 'firebase_options.dart';

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
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
