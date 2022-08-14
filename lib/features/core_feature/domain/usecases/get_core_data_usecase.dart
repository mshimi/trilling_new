import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/core_feature/data/models/core_data_model.dart';
import 'package:trilling_web/features/core_feature/domain/repositories/core_data_repo.dart';

class GetCoreDataUseCase {
  final CoreDataRepo coreDataRepo;

  GetCoreDataUseCase({required this.coreDataRepo});

 Future<Either<Failure, CoreDataModel>> call() async {
   return await coreDataRepo.getCoreData();
  }
}
