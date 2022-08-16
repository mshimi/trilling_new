import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:trilling_web/features/order_feature/domain/entities/collection.dart';
import 'package:trilling_web/features/product_feature/data/models/product_model.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product.dart';

class CollectionModel extends Equatable {
  List<ProductModel> listOfProduct;
  String packungType;
  CollectionModel({
    required this.listOfProduct,
    required this.packungType,
  });

  CollectionModel copyWith({
    List<ProductModel>? listOfProduct,
    String? packungType,
  }) {
    return CollectionModel(
      listOfProduct: listOfProduct ?? this.listOfProduct,
      packungType: packungType ?? this.packungType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'listOfProduct': listOfProduct.map((x) => x.toMap()).toList(),
      'packungType': packungType,
    };
  }

  factory CollectionModel.fromMap(Map<String, dynamic> map) {
    return CollectionModel(
      listOfProduct: List<ProductModel>.from(
          map['listOfProduct']?.map((x) => ProductModel.fromMap(x))),
      packungType: map['packungType'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CollectionModel.fromJson(String source) =>
      CollectionModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CollectionModel(listOfProduct: $listOfProduct, packungType: $packungType)';

  @override
  List<Object> get props => [listOfProduct, packungType];

  factory CollectionModel.fromDomain(Collection collection) {
    List<ProductModel> listOfProductModel = [];
    for (var product in collection.listOfProduct) {
      listOfProductModel.add(ProductModel.fromDomain(product));
    }

    return CollectionModel(
        listOfProduct: listOfProductModel, packungType: collection.packungType);
  }

  Collection toDomain() {
    List<Product> listOfProduct = [];

    for (var productModel in this.listOfProduct) {
       listOfProduct.add(productModel.toDomain()) ;
      }
    return Collection(listOfProduct: listOfProduct, packungType: packungType);
  }
}
