import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/features/client_feature/data/models/client_model.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';
import 'package:trilling_web/features/client_feature/domain/repositories/client_repository.dart';

class GetConcernedClientUseCase {
  final ClientRepository clientRepository;

  GetConcernedClientUseCase({required this.clientRepository});

  Future<Either<Failure, List<ClientModel>>> call({
    required String keyword,
  }) async {
 return  clientRepository.getConcernedClient(keyword: keyword);
  }
}
