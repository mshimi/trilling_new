part of 'new_product_bloc.dart';

abstract class NewProductEvent extends Equatable {
  const NewProductEvent();

  @override
  List<Object> get props => [];
}

class AddCapicityEvent extends NewProductEvent {
  ProductCapicity productCapicity;

  AddCapicityEvent({required this.productCapicity});

  @override
  List<Object> get props => [productCapicity];
}

class AddNewProductEvent extends NewProductEvent {
  final Product product;

  AddNewProductEvent({required this.product});

    @override
  List<Object> get props => [product];
}
