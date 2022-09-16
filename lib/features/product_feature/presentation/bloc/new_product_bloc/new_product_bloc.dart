import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:trilling_web/features/product_feature/data/models/product_model.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product_capicity.dart';

import '../../../../../core/failures/store_failure.dart';
import '../../../domain/usecases/add_new_product.dart';

part 'new_product_event.dart';
part 'new_product_state.dart';

class NewProductBloc extends Bloc<NewProductEvent, NewProductState> {
  final AddNewProductUseCase addNewProductUseCase;

  NewProductBloc({required this.addNewProductUseCase})
      : super(NewProductInitialState()) {
    on<AddNewProductEvent>((event, emit) async {
      print(event.product.name);
      print(event.product.descreption);

      print(event.product.category);

      print(event.product.subCategory);

      print(event.product.minimumPax);

      print(event.product.pricePerPerson);

      Either<Failure, Unit> failureOrDone = await addNewProductUseCase.call(
          productModel: ProductModel.fromDomain(event.product));

      failureOrDone.fold((l) => null,
          (r) => emit(SuccesAddNewProduct(product: event.product)));
    });
  }
}
