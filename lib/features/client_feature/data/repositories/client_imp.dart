import 'dart:html';

import 'package:trilling_web/core/utils/enums.dart';
import 'package:trilling_web/features/client_feature/data/models/client_model.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trilling_web/features/client_feature/domain/repositories/client_repository.dart';
import 'package:trilling_web/core/extentions/firebasefirestore_extention.dart';

class ClientImp implements ClientRepository {
  final FirebaseFirestore firestore;

  ClientImp({required this.firestore});

  /*    Done    */

  @override
  Future<Either<Failure, String>> addNewClient({required Client client}) async {
    try {
      DocumentReference<Map<String, dynamic>> documentReferance =
          await firestore
              .appCollection(dbCollections: DbCollections.client)
              .add(ClientModel.fromDomain(client).toMap());

      return Right(documentReferance.id);
    } catch (e) {
      /* 
      
      remove print

      */
      print(e.toString());
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateClientsData(
      {required ClientModel clientModel}) async {
    try {
      await firestore
          .appCollection(dbCollections: DbCollections.client)
          .doc(clientModel.id)
          .update(clientModel.toMap());

      return (const Right(unit));
    } catch (e) {
      /* 
      
      remove print

      */
      print(e.toString());
      return Left(StoreFailure());
    }
  }

  /* Pinding */

  @override
  Future<Either<Failure, List<ClientModel>>> getAllClients(
      {int limit = 100}) async {
    // should not be used oft
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .appCollection(dbCollections: DbCollections.client)
          .limit(limit)
          .get();

      return Right(querySnapshot.docs
          .map((client) => ClientModel.fromMap(client.data()))
          .toList());
    } catch (e) {
      /* 
      
      remove print

      */
      print(e.toString());
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, List<ClientModel>>> getClientbyCity(
      {required String keyword}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .appCollection(dbCollections: DbCollections.client)
          .limit(20)
          .where('city', isEqualTo: keyword)
          .get();

      return Right(querySnapshot.docs
          .map((e) => ClientModel.fromMap(e.data()))
          .toList());
    } catch (e) {
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, List<ClientModel>>> getClientbyFirstName(
      {required String keyword}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .appCollection(dbCollections: DbCollections.client)
          .limit(20)
          .where('firstName', isGreaterThanOrEqualTo: keyword)
          .get();

      return Right(querySnapshot.docs
          .map((e) => ClientModel.fromMap(e.data()))
          .toList());
    } catch (e) {
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, List<ClientModel>>> getClientbyName(
      {required String keyword}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .appCollection(dbCollections: DbCollections.client)
          .limit(20)
          .where('name', isGreaterThanOrEqualTo: keyword)
          .get();

      return Right(querySnapshot.docs
          .map((e) => ClientModel.fromMap(e.data()))
          .toList());
    } catch (e) {
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, List<ClientModel>>> getClientbydistrict(
      {required String keyword}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .appCollection(dbCollections: DbCollections.client)
          .limit(20)
          .where('district', isEqualTo: keyword)
          .get();

      return Right(querySnapshot.docs
          .map((e) => ClientModel.fromMap(e.data()))
          .toList());
    } catch (e) {
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, List<ClientModel>>> getConcernedClient({
    required String keyword,
  }) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .appCollection(dbCollections: DbCollections.client)
          .where('clientAdresse',
              isGreaterThanOrEqualTo: {'city': 'Herne'}).get();

      List<ClientModel> listOfClientModel = [];
      querySnapshot.docs.forEach((doc) {
        ClientModel clientModel = ClientModel.fromMap(doc.data());
        // print(doc.data());
        listOfClientModel.add(clientModel);
      });

      return Right(listOfClientModel);
    } catch (e) {
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, List<ClientModel>>> getClientbyId(
      {required String keyword}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .appCollection(dbCollections: DbCollections.client)
          .limit(20)
          .where('id', isGreaterThanOrEqualTo: keyword)
          .get();

      return Right(querySnapshot.docs
          .map((e) => ClientModel.fromMap(e.data()))
          .toList());
    } catch (e) {
      return Left(StoreFailure());
    }
  }
}
