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
  Product? _product;
  final double pricePerPerson;

  final String name;
  final String descreption;
  final int minimumPax;
  final List<String> allergySubstances;
  final List<String> additives;

  List<ProductCapicity> productCapicites;

  AddNewProductEvent({
    required this.additives,
    required this.allergySubstances,
    required this.descreption,
    required this.minimumPax,
    required this.name,
    required this.pricePerPerson,
    required this.productCapicites,
  });

  Product get product {
    _product = Product(
        additives: additives,
        allergySubstances: allergySubstances,
        pricePerPerson: pricePerPerson,
        category: '',
        subCategory: '',
        name: name,
        descreption: descreption,
        minimumPax: minimumPax,
        creationInfo: CreationInfo(
            creationDate: DateTime.now(), userId: 'mah', userName: 'mah'),
        productCapicites: productCapicites);

    return _product!;
  }

  @override
  List<Object> get props => [];
}
