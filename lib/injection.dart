import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trilling_web/features/admin_control/domain/repositires/admincontrol_repo.dart';
import 'package:trilling_web/features/admin_control/infrastructure/repositires/admincontrol_imp.dart';
import 'package:trilling_web/features/auth/domain/repositries/auth_repo.dart';
import 'package:trilling_web/features/auth/infrastructure/repositries/auth_imp.dart';

final sl = GetIt.I; // sl == service locator

Future<void> init() async {
//? auth

  sl.registerLazySingleton<AdminControll_Repo>(
      () => AdminControll_Imp(firebaseAuth: sl(), firestore: sl()));

  sl.registerLazySingleton<Auth_Repo>(
      () => Auth_Imp(firebaseAuth: sl(), firebaseFirestore: sl()));

  //! extern
  final friebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => friebaseAuth);

  final firestore = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firestore);
}
