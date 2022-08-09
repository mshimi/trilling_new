import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/features/product_feature/data/models/product_model.dart';
import 'package:trilling_web/features/product_feature/domain/repositories/product_repository.dart';

class AddNewProductUseCase {
  final ProductRepository productRepository;

  AddNewProductUseCase({required this.productRepository});

  Future<Either<Failure, Unit>> call(
      {required ProductModel productModel}) async {
    Either<Failure, String> newProduct =
        await productRepository.addProduct(productModel: productModel);

    Future<Either<Failure, Unit>> changeId = newProduct.fold(
      (failure) async => Left(StoreFailure()),
      (id) async {
        ProductModel newProductModel = productModel.copyWith(id: id);
        return await productRepository.updateProduct(
            productModel: productModel);
      },
    );

    return changeId;
  }
}
