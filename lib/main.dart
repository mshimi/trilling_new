import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trilling_web/bloc_observer.dart';
import 'package:trilling_web/features/core_feature/data/models/city_model.dart';
import 'package:trilling_web/features/core_feature/data/models/core_data_model.dart';
import 'package:trilling_web/features/core_feature/data/models/district_model.dart';
import 'package:trilling_web/features/core_feature/domain/entities/city.dart';
import 'package:trilling_web/features/core_feature/domain/entities/core_data.dart';
import 'package:trilling_web/features/core_feature/domain/entities/district.dart';
import 'package:trilling_web/features/core_feature/domain/entities/product_category.dart';
import 'package:trilling_web/features/core_feature/domain/usecases/update_core_data_usecase.dart';
import 'package:trilling_web/features/order_feature/data/repositories/collection_builder.dart';
import 'package:trilling_web/features/product_feature/domain/entities/creationinfo.dart';
import 'package:trilling_web/features/product_feature/domain/entities/packung.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product_capicity.dart';

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

  // CreationInfo creationInfo =
  //     CreationInfo(creationDate: DateTime.now(), userId: '', userName: '');

  // ProductCapicity productCapicity = ProductCapicity(
  //   minPax: 10,
  //   maxPax: 34,
  //   packung: Packung(name: 'Eckig', value: 0.25),
  // );

  // ProductCapicity productCapicity1 = ProductCapicity(
  //   minPax: 35,
  //   maxPax: 45,
  //   packung: Packung(name: 'Eckig', value: 0.50),
  // );
  // ProductCapicity productCapicity2 = ProductCapicity(
  //   minPax: 46,
  //   maxPax: 57,
  //   packung: Packung(name: 'Eckig', value: 1),
  // );
  // Product product = Product(
  //     pricePerPerson: 10,
  //     category: 'category',
  //     subCategory: 'subCategory',
  //     name: 'name',
  //     descreption: 'descreption',
  //     minimumPax: 14,
  //     creationInfo: creationInfo,
  //     productCapicites: [productCapicity, productCapicity2, productCapicity1]);

  // OrderCollectionBuilderImp().buildCollection(
  //     productList: [product, product, product], paxNumber: 180);

  // Packung packung = Packung(name: 'Eckig', value: 1);
  //   Packung packung1 = Packung(name: 'Eckig', value: 0.5);
  //       Packung packung2 = Packung(name: 'Eckig', value: 0.25);


  // ProductCategory productCategory =
  //     ProductCategory(name: 'Pizza', subCategories: ['tuna', 'margritta']);
  // City city = City(name: 'bochum', districts: [
  //   District(name: 'Altenbochum', transferPrice: 10),
  //   District(name: 'Langendreer', transferPrice: 15),
  // ]);
  // CoreData coreData =
  //     CoreData(categories: [productCategory], cities: [city], packungen: [packung,packung1, packung2]);
  // UpdateCoreDataUseCase(coreDataRepo: sl.get())
  //     .call(coreDataModel: CoreDataModel.fromDomain(coreData));

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}
