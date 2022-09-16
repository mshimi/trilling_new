import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/features/product_feature/data/models/product_model.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product.dart';
import 'package:trilling_web/features/product_feature/domain/usecases/get_product_by_id_usecase.dart';

part 'edit_product_bloc_event.dart';
part 'edit_product_bloc_state.dart';

class EditProductBlocBloc
    extends Bloc<EditProductBlocEvent, EditProductBlocState> {
   Product? internalProduct;
  final String productId;
  final GetProductByIdUseCase getProductByIdUseCase;

  EditProductBlocBloc(
      {this.internalProduct,
      required this.productId,
      required this.getProductByIdUseCase})
      : super(EditProductBlocInitial()) {
    on<EditProductBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController descreptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController minimumPaxController = TextEditingController();

}
