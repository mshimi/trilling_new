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
import 'package:trilling_web/features/client_feature/presentation/bloc/client_page_bloc/client_page_bloc.dart';
import 'package:trilling_web/features/client_feature/presentation/bloc/clients_page_bloc/clients_page_bloc.dart';
import 'package:trilling_web/features/client_feature/presentation/bloc/new_client_bloc/new_client_bloc.dart';
import 'package:trilling_web/features/core_feature/data/repositories/core_data_imp.dart';
import 'package:trilling_web/features/core_feature/domain/repositories/core_data_repo.dart';
import 'package:trilling_web/features/core_feature/domain/usecases/get_core_data_usecase.dart';
import 'package:trilling_web/features/core_feature/domain/usecases/update_core_data_usecase.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';
import 'package:trilling_web/features/order_feature/data/repositories/order_repository_imp.dart';
import 'package:trilling_web/features/order_feature/domain/repositories/order_repository.dart';
import 'package:trilling_web/features/order_feature/domain/usecases/add_new_order.dart';
import 'package:trilling_web/features/order_feature/domain/usecases/get_all_order_by_day.dart';
import 'package:trilling_web/features/order_feature/domain/usecases/get_cancelled_orders.dart';
import 'package:trilling_web/features/order_feature/domain/usecases/get_not_delivered_orders.dart';
import 'package:trilling_web/features/order_feature/domain/usecases/get_order_by_Id.dart';
import 'package:trilling_web/features/order_feature/domain/usecases/get_orders_by_bookingdate.dart';
import 'package:trilling_web/features/order_feature/domain/usecases/get_orders_by_client.dart';
import 'package:trilling_web/features/order_feature/domain/usecases/get_orders_for_spacific_period.dart';
import 'package:trilling_web/features/order_feature/domain/usecases/get_ready_orders.dart';
import 'package:trilling_web/features/order_feature/domain/usecases/get_uncollected_orders.dart';
import 'package:trilling_web/features/order_feature/domain/usecases/get_unpaid_orders.dart';
import 'package:trilling_web/features/order_feature/domain/usecases/update_order.dart';
import 'package:trilling_web/features/order_feature/presentation/bloc/orders_bloc/orders_bloc.dart';
import 'package:trilling_web/features/product_feature/domain/repositories/product_repository.dart';
import 'package:trilling_web/features/product_feature/data/repositories/product_imp.dart';
import 'package:trilling_web/features/product_feature/domain/usecases/add_new_product.dart';
import 'package:trilling_web/features/product_feature/domain/usecases/update_product.dart';

final sl = GetIt.I; // sl == service locator

Future<void> init() async {
//? Core
/* Repos */
  sl.registerLazySingleton<CoreDataRepo>(
      () => CoreDataImp(firestore: sl.get()));

  /* Core useCases */

  sl.registerLazySingleton<GetCoreDataUseCase>(
      () => GetCoreDataUseCase(coreDataRepo: sl.get()));

  sl.registerLazySingleton<UpdateCoreDataUseCase>(
      () => UpdateCoreDataUseCase(coreDataRepo: sl.get()));

//? auth

/*  Repos   */
  sl.registerLazySingleton<Auth_Repo>(
      () => Auth_Imp(firebaseAuth: sl.get(), firebaseFirestore: sl.get()));

  sl.registerLazySingleton<ClientRepository>(
      () => ClientImp(firestore: sl.get()));

  sl.registerLazySingleton<ProductRepository>(
      () => ProductImp(firestore: sl.get()));

  sl.registerLazySingleton<OrderRepository>(
      () => OrderImp(firestore: sl.get()));

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

  /* Orders UseCases */

  sl.registerLazySingleton<AddNewOrderUseCase>(
      () => AddNewOrderUseCase(orderRepository: sl.get()));

  sl.registerLazySingleton<GetAllOrdersByDayUseCase>(
      () => GetAllOrdersByDayUseCase(orderRepository: sl.get()));
  sl.registerLazySingleton<GetCancelledOrdersUseCase>(
      () => GetCancelledOrdersUseCase(orderRepository: sl.get()));
  sl.registerLazySingleton<GetUnDeliveredOrdersUseCase>(
      () => GetUnDeliveredOrdersUseCase(orderRepository: sl.get()));
  sl.registerLazySingleton<GetOrderByIdUseCase>(
      () => GetOrderByIdUseCase(orderRepository: sl.get()));
  sl.registerLazySingleton<GetOrdesByBookingDateUseCase>(
      () => GetOrdesByBookingDateUseCase(orderRepository: sl.get()));
  sl.registerLazySingleton<GetOrdersByClientUseCase>(
      () => GetOrdersByClientUseCase(orderRepository: sl.get()));
  sl.registerLazySingleton<GetOrdesForSpacificPeriodUseCase>(
      () => GetOrdesForSpacificPeriodUseCase(orderRepository: sl.get()));
  sl.registerLazySingleton<GetReadyOrdersUseCase>(
      () => GetReadyOrdersUseCase(orderRepository: sl.get()));
  sl.registerLazySingleton<GetUnCollectedOrdersUseCase>(
      () => GetUnCollectedOrdersUseCase(orderRepository: sl.get()));
  sl.registerLazySingleton<GetUnPaidOrdersUseCase>(
      () => GetUnPaidOrdersUseCase(orderRepository: sl.get()));
  sl.registerLazySingleton<UpdateAnOrderUseCase>(
      () => UpdateAnOrderUseCase(orderRepository: sl.get()));

  //bloc

  sl.registerFactory<AuthBloc>(() => AuthBloc(auth_repo: sl.get()));

  sl.registerFactory<NewClientBloc>(
      () => NewClientBloc(inputValidatorRepository: sl.get()));

  sl.registerFactory<HomeNavigatorBloc>(() => HomeNavigatorBloc());

  sl.registerFactory<CoreBloc>(() =>
      CoreBloc(getCoreDataUseCase: sl.get(), updateCoreDataUseCase: sl.get()));

  sl.registerFactory<OrdersBloc>(() => OrdersBloc( getAllOrdersByDayUseCase: sl.get()));

  sl.registerFactory<ClientsPageBloc>(() => ClientsPageBloc(
      addNewClientUseCase: sl.get(),
      getAllClientsUseCase: sl.get(),
      getClientsByCityUseCase: sl.get(),
      getClientsByDistrictUseCase: sl.get(),
      getClientsByFirstNameUseCase: sl.get(),
      getClientsByIdUseCase: sl.get(),
      getClientsByNameUseCase: sl.get(),
      coreBloc: sl.get()));

  sl.registerFactory<ClientPageBloc>(() => ClientPageBloc(
      getClientsByIdUseCase: sl.get(),
      getOrdersByClientUseCase: sl.get(),
      updateClientDataUseCase: sl.get()));

  //! extern
  final friebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton<FirebaseAuth>(() => friebaseAuth);

  final firestore = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firestore);
}
