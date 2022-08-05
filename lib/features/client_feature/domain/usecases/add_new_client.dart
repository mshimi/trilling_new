import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/usecase/usecase.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';
import 'package:trilling_web/features/client_feature/domain/repositories/client_repository.dart';

class AddNewClientUseCase {
  ClientRepository clientRepository;

  AddNewClientUseCase({required this.clientRepository, });

 Future<Either<Failure, Unit>>  call({required Client client,}) {
   return clientRepository.addNewClient(client: client);



  /* 
  
  todo: replace client.id with doc.id 
  
  */



  }
}
