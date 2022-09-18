import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/features/core_feature/domain/entities/core_data.dart';
import 'package:trilling_web/features/core_feature/domain/usecases/coredata_controller.dart';
import 'package:trilling_web/features/product_feature/data/models/product_model.dart';
import 'package:trilling_web/features/product_feature/domain/usecases/get_product_by_id_usecase.dart';
import 'package:trilling_web/features/product_feature/domain/usecases/update_product.dart';
import 'package:trilling_web/features/product_feature/presentation/bloc/edit_product_bloc/edit_product_bloc_bloc.dart';

import '../entities/product.dart';

class ProductControllerUseCase {
  final List<Product> _products = [];
  final GetProductByIdUseCase getProductByIdUseCase;
  final UpdateProductUseCase updateProductUseCase;
  final CoreDataControllerUseCase coreDataControllerUseCase;
  CoreData? coreData;
  ProductControllerUseCase(
      {required this.coreDataControllerUseCase,
      required this.getProductByIdUseCase,
      required this.updateProductUseCase});

  Future<EditProductBlocState> getProductbyId(String productId) async {
    coreData = await coreDataControllerUseCase.coreData;

    if (coreData == null) {
      return ErrorGettingProductState();
    }

    if (_products.any((element) => element.id == productId)) {
      return SucsessGettingProductState(
          product: _products.firstWhere((element) => element.id == productId),
          coreData: coreData!);
    } else {
      Either<Failure, ProductModel> failureOrProduct =
          await getProductByIdUseCase.call(productId: productId);

      return failureOrProduct.fold(
          (l) => ErrorGettingProductState(),
          (r) => SucsessGettingProductState(
              product: r.toDomain(), coreData: coreData!));
    }
  }

  Future<EditProductBlocState> updateProduct({required Product product}) async {
    Either<Failure, ProductModel> failureOrunite = await updateProductUseCase
        .call(productModel: ProductModel.fromDomain(product));
         coreData = await coreDataControllerUseCase.coreData;
    return failureOrunite.fold(
        (l) => ErrorGettingProductState(),
        (r) => SucsessGettingProductState(
            product: r.toDomain(), coreData: coreData!));
  }

  void _addProduct(Product product) {
    _products.add(product);
  }

  List<Product> get allProducts {
    return _products;
  }
}
