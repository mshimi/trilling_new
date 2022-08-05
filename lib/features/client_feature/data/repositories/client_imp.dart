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

  @override
  Future<Either<Failure, Unit>> addNewClient({required Client client}) async {
    try {
      await firestore
          .appCollection(dbCollections: DbCollections.client)
          .add(ClientModel.fromDomain(client).toMap());

      return Right(unit);
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

      return (Right(unit));
    } catch (e) {
      /* 
      
      remove print

      */
      print(e.toString());
      return Left(StoreFailure());
    }
  }

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
  Future<Either<Failure, List<ClientModel>>> getConcernedClient({
    required String keyword,
  }) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .appCollection(dbCollections: DbCollections.client)
          .limit(20)
          .where('name', arrayContains: 'ahmed').get();

      return Right(querySnapshot.docs
          .map((e) => ClientModel.fromMap(e.data()))
          .toList());
    } catch (e) {
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
          .where('', arrayContains: keyword)
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
          .where('', arrayContains: keyword)
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
          .where('', arrayContains: keyword)
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
          .where('', arrayContains: keyword)
          .get();

      return Right(querySnapshot.docs
          .map((e) => ClientModel.fromMap(e.data()))
          .toList());
    } catch (e) {
      return Left(StoreFailure());
    }
  }
}
