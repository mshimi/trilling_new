import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:trilling_web/bloc_observer.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/core/utils/enums.dart';
import 'package:trilling_web/features/client_feature/domain/entities/adresse.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';
import 'package:trilling_web/features/client_feature/domain/usecases/add_new_client.dart';
import 'package:trilling_web/features/client_feature/domain/usecases/get_all_clients.dart';
import 'package:trilling_web/features/client_feature/domain/usecases/get_client_by_city.dart';
import 'package:trilling_web/features/client_feature/domain/usecases/get_client_by_firstname.dart';
import 'package:trilling_web/features/client_feature/domain/usecases/get_concerned_client.dart';
import 'package:trilling_web/injection.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:trilling_web/myapp.dart';

import 'features/client_feature/data/models/client_model.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await init();

  Either<Failure, List<ClientModel>> eitherFailureOrListOfClients =
      await sl.get<GetConcernedClientUseCase>().call(keyword: 'Sheh');

  eitherFailureOrListOfClients.fold((l) => print(l), (r) => print(r));

//   Adresse adresse = Adresse(
//       city: 'Bochum',
//       houseNumber: '13',
//       district: 'Mitte',
//       zipCode: 44653,
//       street: '');

//   Client client = Client(
//       firstName: 'Janine',
//       name: 'Greiwing',
//       id: 'id',
//       clientAdresse: adresse,
//       createdBy: 'Mahmoud',
//       createdOn: DateTime.now().toString());
// // //   ClientRepository clientRepository = ClientImp(firestore: sl.get<FirebaseFirestore>());
//  sl.get<AddNewClientUseCase>().call(client: client);

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}
