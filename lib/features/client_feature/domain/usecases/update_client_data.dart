import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/features/client_feature/data/models/client_model.dart';
import 'package:trilling_web/features/client_feature/domain/repositories/client_repository.dart';

class UpdateClientDataUseCase {
  final ClientRepository clientRepository;

  UpdateClientDataUseCase({required this.clientRepository});

  Future<Either<Failure, Unit>>  call({required ClientModel clientModel}) async {
  return await  clientRepository.updateClientsData(clientModel: clientModel);
  }
}
