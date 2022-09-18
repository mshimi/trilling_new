import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trilling_web/core/extentions/firebasefirestore_extention.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/utils/enums.dart';
import 'package:trilling_web/features/product_feature/data/models/product_model.dart';
import 'package:trilling_web/features/product_feature/domain/repositories/product_repository.dart';

class ProductImp implements ProductRepository {
  final FirebaseFirestore firestore;

  ProductImp({required this.firestore});

  @override
  Future<Either<Failure, String>> addProduct(
      {required ProductModel productModel}) async {
    try {
      DocumentReference<Map<String, dynamic>> document = await firestore
          .appCollection(dbCollections: DbCollections.products)
          .add(productModel.toMap());

      return Right(document.id);
    } catch (e) {
      return left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, ProductModel>> updateProduct(
      {required ProductModel productModel}) async {
    try {
      await firestore
          .appCollection(dbCollections: DbCollections.products)
          .doc(productModel.id!)
          .update(productModel.toMap());

      return  Right(productModel);
    } catch (e) {
      return left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(
      {required String productId}) async {
    try {
      await firestore
          .appCollection(dbCollections: DbCollections.products)
          .doc(productId)
          .delete();

      return const Right(unit);
    } catch (e) {
      return left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById(
      {required String productId}) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc = await firestore
          .appCollection(dbCollections: DbCollections.products)
          .doc(productId)
          .get();

      return Right(ProductModel.fromMap(doc.data()!));
    } catch (e) {
      return Left(StoreFailure());
    }
  }
}
