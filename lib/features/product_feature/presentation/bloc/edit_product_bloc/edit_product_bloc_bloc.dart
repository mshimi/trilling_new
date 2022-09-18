import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:trilling_web/features/core_feature/domain/entities/core_data.dart';
import 'package:trilling_web/features/core_feature/domain/usecases/coredata_controller.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product.dart';
import 'package:trilling_web/features/product_feature/domain/usecases/get_product_by_id_usecase.dart';

import '../../../domain/usecases/product_usecase.dart';
part 'edit_product_bloc_event.dart';
part 'edit_product_bloc_state.dart';

class EditProductBlocBloc
    extends Bloc<EditProductBlocEvent, EditProductBlocState> {
  Product? internalProduct;
  final String productId;
   CoreData? coreData;
  CoreDataControllerUseCase coreDataControllerUseCase;
  final ProductControllerUseCase productControllerUseCase;

 


  EditProductBlocBloc(
      {this.internalProduct,
      this.coreData,
      required this.coreDataControllerUseCase,
      required this.productId,
      required this.productControllerUseCase})
      : super(EditProductBlocInitial()) {
    on<InitEvent>((event, emit) async {
     
   

      EditProductBlocState editProductBlocState =
          await productControllerUseCase.getProductbyId(productId);
      emit(editProductBlocState);
    });
  }
}
