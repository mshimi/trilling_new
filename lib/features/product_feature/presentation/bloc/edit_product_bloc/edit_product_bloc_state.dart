part of 'edit_product_bloc_bloc.dart';

abstract class EditProductBlocState extends Equatable {
  const EditProductBlocState();
  
  @override
  List<Object> get props => [];
}

class EditProductBlocInitial extends EditProductBlocState {}

class Error