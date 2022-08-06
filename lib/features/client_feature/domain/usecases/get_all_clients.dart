import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/features/client_feature/data/models/client_model.dart';
import 'package:trilling_web/features/client_feature/domain/repositories/client_repository.dart';

//Tested

class GetAllClientsUseCase {
  final ClientRepository clientRepository;

  GetAllClientsUseCase({required this.clientRepository});

  Future<Either<Failure, List<ClientModel>>> call({int limit = 100}) async {
    return await clientRepository.getAllClients(limit: limit);
  }
}
