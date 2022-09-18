import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/features/product_feature/data/models/product_model.dart';
import 'package:trilling_web/features/product_feature/domain/repositories/product_repository.dart';

class AddNewProductUseCase {
  final ProductRepository productRepository;

  AddNewProductUseCase({required this.productRepository});

  Future<Either<Failure, String>> call(
      {required ProductModel productModel}) async {
   
      Either<Failure, String> newProduct =
          await productRepository.addProduct(productModel: productModel);

      Future<Either<Failure, String>> changeId = newProduct.fold(
        (failure) async => Left(StoreFailure()),
        (id) async {
          ProductModel newProductModel = productModel.copyWith(id: id);
          await productRepository.updateProduct(productModel: newProductModel);
          return Right(id);
        },
      );

      return (changeId);
   
  }
}
