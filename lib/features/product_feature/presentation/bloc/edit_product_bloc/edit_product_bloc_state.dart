part of 'edit_product_bloc_bloc.dart';

abstract class EditProductBlocState extends Equatable {
  EditProductBlocState();

  @override
  List<Object> get props => [];
}

class EditProductBlocInitial extends EditProductBlocState {}

class ErrorGettingProductState extends EditProductBlocState {}

class SucsessGettingProductState extends EditProductBlocState {
  final Product product;
  final CoreData coreData;
  SucsessGettingProductState({required this.product, required this.coreData});
}
