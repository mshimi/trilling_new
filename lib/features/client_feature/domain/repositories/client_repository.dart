import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/features/client_feature/data/models/client_model.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';

abstract class ClientRepository {
  Future<Either<Failure, String>> addNewClient({required Client client});

/*  

Done

*/

  Future<Either<Failure, Unit>> updateClientsData(
      {required ClientModel clientModel});

  Future<Either<Failure, List<ClientModel>>> getAllClients({int limit = 100});

  Future<Either<Failure, List<ClientModel>>> getClientbyName(
      {required String keyword});

  Future<Either<Failure, List<ClientModel>>> getClientbyFirstName(
      {required String keyword});

  Future<Either<Failure, List<ClientModel>>> getClientbyCity(
      {required String keyword});

  Future<Either<Failure, List<ClientModel>>> getClientbydistrict(
      {required String keyword});

  Future<Either<Failure, List<ClientModel>>> getConcernedClient(
      {required String keyword});

      Future<Either<Failure, List<ClientModel>>> getClientbyId(
      {required String keyword});
}

