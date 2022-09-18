import 'package:trilling_web/features/core_feature/data/models/core_data_model.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:trilling_web/features/core_feature/domain/entities/core_data.dart';
import 'package:trilling_web/features/core_feature/domain/usecases/get_core_data_usecase.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';

class CoreDataControllerUseCase {
  CoreData? _CoreData;
  GetCoreDataUseCase getCoreDataUseCase;

  CoreDataControllerUseCase({required this.getCoreDataUseCase});

  Future<CoreData?> get coreData async {
    if (_CoreData == null) {
      Either<Failure, CoreDataModel> failureOrDateModel = await getCoreDataUseCase.call();
     CoreData? failureOrDateCore =  failureOrDateModel.fold((l) => null, (r) => r.toDomain());

      return failureOrDateCore;
    } else {
      return _CoreData!;
    }
  }
}
