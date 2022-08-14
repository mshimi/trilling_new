import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/core_feature/data/models/core_data_model.dart';

abstract class CoreDataRepo {
  
  Future<Either<Failure, CoreDataModel>> getCoreData();
    Future<Either<Failure, Unit>> updateCoreData({required CoreDataModel coreDataModel});

}
