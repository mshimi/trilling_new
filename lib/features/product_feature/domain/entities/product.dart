import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/product_feature/domain/entities/creationinfo.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product_capicity.dart';

class Product extends Equatable {
  String? id;
  double pricePerPerson;
  String category;
  String subCategory;
  String name;
  String descreption;
  int minimumPax;
  CreationInfo creationInfo;
  List<String>? allergySubstances;
  List<String>? additives;
  List<ProductCapicity> productCapicites;
  Product({
    this.id,
    required this.pricePerPerson,
    required this.category,
    required this.subCategory,
    required this.name,
    required this.descreption,
    required this.minimumPax,
    required this.creationInfo,
    this.allergySubstances,
    this.additives,
    required this.productCapicites,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id!, pricePerPerson];
}
