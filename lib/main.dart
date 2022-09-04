import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:trilling_web/bloc_observer.dart';
import 'package:trilling_web/features/auth/domain/repositries/auth_repo.dart';
import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/order_feature/data/models/order_model.dart';
import 'package:trilling_web/features/order_feature/domain/usecases/add_new_order.dart';
import 'package:trilling_web/features/order_feature/domain/entities/order.dart'
    as OrderItem;
import 'package:trilling_web/features/product_feature/domain/entities/creationinfo.dart';
import 'package:trilling_web/features/product_feature/domain/entities/packung.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product_capicity.dart';

import 'package:trilling_web/injection.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:trilling_web/myapp.dart';
import 'features/order_feature/domain/entities/transfer.dart';
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

  Either<Failure, ClientModel> clientorfailure = await sl
      .get<GetClientsByIdUseCase>()
      .call(keyword: '2mjF6gvqfjZs9RhfkfLS');

  var client = clientorfailure.fold((l) => null, (r) => r.toDomain());

  Transfer transfer = Transfer(
      driver: '',
      transferDate: DateTime.now(),
      timeFrom: DateTime.now(),
      timeTo: DateTime.now());

  OrderItem.Order order = OrderItem.Order(
    isCancelled: false,
    isDelivared: false,
    isPaid: false,
    isReady: false,
    iscollected: false,
    id: 'haskfaksjhd',
    totalItems: 10,
    totalPrice: 19.50,
    allergySubstances: [],
    client: client!,
    abholung: transfer,
    creationInfo: CreationInfo(
        creationDate: DateTime.now(), userId: 'sjkdakfh', userName: 'username'),
    products: [
      Product(
        pricePerPerson: 10,
        category: 'category',
        subCategory: 'subCategory',
        name: 'name',
        descreption: 'descreption',
        minimumPax: 10,
        creationInfo: CreationInfo(
            userName: 'userName',
            userId: 'userId',
            creationDate: DateTime.now()),
        productCapicites: [
          ProductCapicity(
              minPax: 1, maxPax: 10, packung: Packung(name: 'Eckig', value: 1))
        ],
        additives: [],
      ),
    ],
    bringen: transfer,
    notes: '',
    delivaryBooked: true,
    delivaryAdresse: client.clientAdresse,
    eventDate: DateTime.now(),
    bookingDate: DateTime.now(),
    collectionBooked: true,
    collections: [],
  );

  // sl
  //     .get<AddNewOrderUseCase>()
  //     .call(clientId: client.id, orderModel: OrderModel.fromDomain(order));

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
