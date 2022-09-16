part of 'new_product_bloc.dart';

abstract class NewProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewProductInitialState extends NewProductState {}


class SuccesAddNewProduct extends NewProductState {

  final Product product;

SuccesAddNewProduct({required this.product});
    @override
  List<Object> get props => [];


}