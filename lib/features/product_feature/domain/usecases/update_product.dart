import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:trilling_web/features/product_feature/data/models/product_model.dart';
import 'package:trilling_web/features/product_feature/domain/repositories/product_repository.dart';

class UpdateProductUseCase {
  final ProductRepository productRepository;

  UpdateProductUseCase({required this.productRepository});

  Future<Either<Failure, ProductModel>> call({required ProductModel productModel}) async {
 return await  productRepository.updateProduct(productModel: productModel);
  }
}
