import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/features/client_feature/data/models/client_model.dart';
import 'package:trilling_web/features/client_feature/domain/repositories/client_repository.dart';

//Tested

class GetClientsByNameUseCase {
  final ClientRepository clientRepository;

  GetClientsByNameUseCase({required this.clientRepository});

  Future<Either<Failure, List<ClientModel>>> call({int limit = 100, required String keyword}) async {
    return await clientRepository.getClientbyName(keyword: keyword);
  }
}
