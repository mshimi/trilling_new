import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:trilling_web/features/client_feature/data/models/client_model.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';
import 'package:trilling_web/features/client_feature/domain/repositories/client_repository.dart';

//Tested

class AddNewClientUseCase {
  ClientRepository clientRepository;

  AddNewClientUseCase({
    required this.clientRepository,
  });

  Future<Either<Failure, ClientModel>> call({
    required Client client,
  }) async {
    Either<Failure, String> newClient =
        await clientRepository.addNewClient(client: client);

    Future<Either<Failure, ClientModel>> changeIdOrFailure = newClient.fold(
      (l) async {
        return Left(StoreFailure());
      },
      (r) async {
        ClientModel clientModel =
            ClientModel.fromDomain(client).copyWith(id: r);

        await clientRepository.updateClientsData(clientModel: clientModel);

        return  Right(clientModel);
      },
    );
    return changeIdOrFailure;
  }
}
