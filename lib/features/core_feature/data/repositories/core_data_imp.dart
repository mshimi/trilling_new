import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trilling_web/core/utils/enums.dart';
import 'package:trilling_web/features/core_feature/data/models/core_data_model.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:trilling_web/features/core_feature/domain/repositories/core_data_repo.dart';
import 'package:trilling_web/core/extentions/firebasefirestore_extention.dart';

class CoreDataImp implements CoreDataRepo {
  final FirebaseFirestore firestore;

  CoreDataImp({required this.firestore});

  @override
  Future<Either<Failure, CoreDataModel>> getCoreData() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await firestore
          .appCollection(dbCollections: DbCollections.core)
          .doc('core')
          .get();

      return right(CoreDataModel.fromMap(documentSnapshot.data()!));
    } catch (e) {
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateCoreData(
      {required CoreDataModel coreDataModel}) async {
    try {
      await firestore
          .appCollection(dbCollections: DbCollections.core)
          .doc('core')
          .update(coreDataModel.toMap());

      return const Right(unit);
    } catch (e) {
      return Left(StoreFailure());
    }
  }
}
