import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:trilling_web/features/auth/domain/repositries/auth_repo.dart';
import 'package:trilling_web/features/auth/infrastructure/repositries/auth_imp.dart';
import 'package:trilling_web/features/auth/presentation/bloc/home_navigator_bloc/home_navigator_bloc.dart';
import 'package:trilling_web/features/auth/presentation/login_page/bloc/auth_bloc/auth_bloc.dart';
import 'package:trilling_web/features/client_feature/data/repositories/client_imp.dart';
import 'package:trilling_web/features/client_feature/data/repositories/input_validator_imp.dart';
import 'package:trilling_web/features/client_feature/domain/repositories/client_repository.dart';
import 'package:trilling_web/features/client_feature/domain/repositories/input_validator.dart';
import 'package:trilling_web/features/client_feature/domain/usecases/add_new_client.dart';
import 'package:trilling_web/features/client_feature/domain/usecases/get_all_clients.dart';
import 'package:trilling_web/features/client_feature/domain/usecases/get_client_by_city.dart';
import 'package:trilling_web/features/client_feature/domain/usecases/get_client_by_district.dart';
import 'package:trilling_web/features/client_feature/domain/usecases/get_client_by_firstname.dart';
import 'package:trilling_web/features/client_feature/domain/usecases/get_client_by_id.dart';
import 'package:trilling_web/features/client_feature/domain/usecases/get_client_by_name.dart';
import 'package:trilling_web/features/client_feature/domain/usecases/get_concerned_client.dart';
import 'package:trilling_web/features/client_feature/domain/usecases/update_client_data.dart';
import 'package:trilling_web/features/client_feature/presentation/bloc/new_client_bloc/new_client_bloc.dart';
import 'package:trilling_web/features/product_feature/domain/repositories/product_repository.dart';
import 'package:trilling_web/features/product_feature/data/repositories/product_imp.dart';
import 'package:trilling_web/features/product_feature/domain/usecases/add_new_product.dart';
import 'package:trilling_web/features/product_feature/domain/usecases/update_product.dart';

final sl = GetIt.I; // sl == service locator

Future<void> init() async {
//? auth

/*  Repos   */
  sl.registerLazySingleton<Auth_Repo>(
      () => Auth_Imp(firebaseAuth: sl.get(), firebaseFirestore: sl.get()));

  sl.registerLazySingleton<ClientRepository>(
      () => ClientImp(firestore: sl.get()));

  sl.registerLazySingleton<ProductRepository>(
      () => ProductImp(firestore: sl.get()));

  /* product UseCases  */

  sl.registerLazySingleton<AddNewProductUseCase>(
      () => AddNewProductUseCase(productRepository: sl.get()));

  sl.registerLazySingleton<UpdateProductUseCase>(
      () => UpdateProductUseCase(productRepository: sl.get()));

  /* Client UseCases  */

  sl.registerLazySingleton<AddNewClientUseCase>(
      () => AddNewClientUseCase(clientRepository: sl.get()));

  sl.registerLazySingleton<UpdateClientDataUseCase>(
      () => UpdateClientDataUseCase(clientRepository: sl.get()));

  sl.registerLazySingleton<GetConcernedClientUseCase>(
      () => GetConcernedClientUseCase(clientRepository: sl.get()));

  sl.registerLazySingleton<GetAllClientsUseCase>(
      () => GetAllClientsUseCase(clientRepository: sl.get()));

  sl.registerLazySingleton<GetClientsByCityUseCase>(
      () => GetClientsByCityUseCase(clientRepository: sl.get()));

  sl.registerLazySingleton<GetClientsByFirstNameUseCase>(
      () => GetClientsByFirstNameUseCase(clientRepository: sl.get()));

  sl.registerLazySingleton<GetClientsByNameUseCase>(
      () => GetClientsByNameUseCase(clientRepository: sl.get()));

  sl.registerLazySingleton<GetClientsByDistrictUseCase>(
      () => GetClientsByDistrictUseCase(clientRepository: sl.get()));

  sl.registerLazySingleton<GetClientsByIdUseCase>(
      () => GetClientsByIdUseCase(clientRepository: sl.get()));

  sl.registerLazySingleton<InputValidatorRepository>(() => InputValidatorImp());

  //bloc

  sl.registerFactory<AuthBloc>(() => AuthBloc(auth_repo: sl.get()));

  sl.registerFactory<NewClientBloc>(
      () => NewClientBloc(inputValidatorRepository: sl.get()));

  sl.registerFactory<HomeNavigatorBloc>(() => HomeNavigatorBloc());

  //! extern
  final friebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton<FirebaseAuth>(() => friebaseAuth);

  final firestore = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firestore);
}
