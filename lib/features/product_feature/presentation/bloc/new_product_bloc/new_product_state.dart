part of 'new_product_bloc.dart';

abstract class NewProductState extends Equatable {
  final String? subCategory;
  final String? category;
  const NewProductState({ this.subCategory,  this.category});

  @override
  List<Object> get props => [subCategory!];
}

class NewProductInitial extends NewProductState {
  NewProductInitial({ super.subCategory, super.category});
}
