import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:trilling_web/features/product_feature/domain/repositories/product_repository.dart';

class DeleteProductUseCase {
  final ProductRepository productRepository;

  DeleteProductUseCase({required this.productRepository});

  Future<Either<Failure, Unit>> call({required String productId}) async {
 return await  productRepository.deleteProduct(productId: productId);
  }
}
