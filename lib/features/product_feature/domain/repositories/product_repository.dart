import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/features/product_feature/data/models/product_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, String>> addProduct(
      {required ProductModel productModel});

  Future<Either<Failure, ProductModel>> updateProduct(
      {required ProductModel productModel});

  Future<Either<Failure, Unit>> deleteProduct({required String productId});

  Future<Either<Failure, ProductModel>> getProductById(
      {required String productId});
}
