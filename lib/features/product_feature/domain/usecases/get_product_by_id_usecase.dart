import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/features/product_feature/data/models/product_model.dart';

import '../repositories/product_repository.dart';

class GetProductByIdUseCase {
  final ProductRepository productRepository;

  GetProductByIdUseCase({required this.productRepository});

Future<Either<Failure, ProductModel>> call({required String productId})  {
     return   productRepository.getProductById(productId: productId);


  }
}
