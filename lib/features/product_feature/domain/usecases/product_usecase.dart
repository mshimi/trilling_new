import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/features/product_feature/data/models/product_model.dart';
import 'package:trilling_web/features/product_feature/domain/usecases/get_product_by_id_usecase.dart';
import 'package:trilling_web/features/product_feature/domain/usecases/update_product.dart';
import 'package:trilling_web/features/product_feature/presentation/bloc/edit_product_bloc/edit_product_bloc_bloc.dart';

import '../entities/product.dart';

class ProductControllerUseCase {
  final List<Product> _products = [];
  final GetProductByIdUseCase getProductByIdUseCase;
  final UpdateProductUseCase updateProductUseCase;

  ProductControllerUseCase(
      {required this.getProductByIdUseCase,
      required this.updateProductUseCase});

  Future<Product> getProductbyId(String productId) async {
    if (_products.any((element) => element.id == productId)) {
      return _products.firstWhere((element) => element.id == productId);
    } else {
      Either<Failure, ProductModel> value =
          await getProductByIdUseCase.call(productId: productId);
      late Product product;
      value.fold((l) => null, (r) {
        product = r.toDomain();
        _products.insert(0, product);
      });

      return product;
    }
  }

  EditProductBlocState updateProduct({Product product}) async {
    Either<Failure, Unit> failureOrunite = await updateProductUseCase.call(
        productModel: ProductModel.fromDomain(product));
   return failureOrunite.fold((l) => null, (r) => null);
  }
}
