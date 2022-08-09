import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:trilling_web/features/product_feature/data/models/creation_info_model.dart';
import 'package:trilling_web/features/product_feature/data/models/product_capicity_model.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product_capicity.dart';

class ProductModel extends Equatable {
  String? id;
  double pricePerPerson;
  String category;
  String subCategory;
  String name;
  String descreption;
  int minimumPax;
  CreationInfoModel creationInfo;
  List<String>? allergySubstances;
  List<String>? additives;
  List<ProductCapicityModel> productCapicites;
  ProductModel({
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

  ProductModel copyWith({
    String? id,
    double? pricePerPerson,
    String? category,
    String? subCategory,
    String? name,
    String? descreption,
    int? minimumPax,
    CreationInfoModel? creationInfo,
    List<String>? allergySubstances,
    List<String>? additives,
    List<ProductCapicityModel>? ProductCapicites,
  }) {
    return ProductModel(
      id: id ?? this.id,
      pricePerPerson: pricePerPerson ?? this.pricePerPerson,
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
      name: name ?? this.name,
      descreption: descreption ?? this.descreption,
      minimumPax: minimumPax ?? this.minimumPax,
      creationInfo: creationInfo ?? this.creationInfo,
      allergySubstances: allergySubstances ?? this.allergySubstances,
      additives: additives ?? this.additives,
      productCapicites: ProductCapicites ?? this.productCapicites,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pricePerPerson': pricePerPerson,
      'category': category,
      'subCategory': subCategory,
      'name': name,
      'descreption': descreption,
      'minimumPax': minimumPax,
      'creationInfo': creationInfo.toMap(),
      'allergySubstances': allergySubstances,
      'additives': additives,
      'productCapicites': productCapicites.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      pricePerPerson: map['pricePerPerson']?.toDouble() ?? 0.0,
      category: map['category'] ?? '',
      subCategory: map['subCategory'] ?? '',
      name: map['name'] ?? '',
      descreption: map['descreption'] ?? '',
      minimumPax: map['minimumPax']?.toInt() ?? 0,
      creationInfo: CreationInfoModel.fromMap(map['creationInfo']),
      allergySubstances: List<String>.from(map['allergySubstances']),
      additives: List<String>.from(map['additives']),
      productCapicites: List<ProductCapicityModel>.from(
          map['productCapicites']?.map((x) => ProductCapicityModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, pricePerPerson: $pricePerPerson, category: $category, subCategory: $subCategory, name: $name, descreption: $descreption, minimumPax: $minimumPax, creationInfo: $creationInfo, allergySubstances: $allergySubstances, additives: $additives, ProductCapicites: $productCapicites)';
  }

  @override
  List<Object> get props {
    return [
      id!,
      pricePerPerson,
      category,
      subCategory,
      name,
      descreption,
      minimumPax,
      creationInfo,
      allergySubstances!,
      additives!,
      productCapicites,
    ];
  }

  factory ProductModel.fromDomain(Product product) {
    List<ProductCapicityModel> listOfModel = [];

    product.productCapicites.forEach((ProductCapicity productCapicity) {
      listOfModel.add(ProductCapicityModel.fromDomain(productCapicity));
    });

    return ProductModel(
      pricePerPerson: product.pricePerPerson,
      category: product.category,
      subCategory: product.subCategory,
      name: product.name,
      descreption: product.descreption,
      minimumPax: product.minimumPax,
      creationInfo: CreationInfoModel.fromDomain(product.creationInfo),
      productCapicites: listOfModel,
      additives: product.additives,
      allergySubstances: product.allergySubstances,
    );
  }

  Product toDomain() {
    List<ProductCapicity> listOfDomain = [];
    productCapicites.forEach(
      (element) {
        listOfDomain.add(element.toDomain());
      },
    );

    return Product(
      pricePerPerson: pricePerPerson,
      category: category,
      subCategory: subCategory,
      name: name,
      descreption: descreption,
      minimumPax: minimumPax,
      creationInfo: creationInfo.toDomain(),
      productCapicites: listOfDomain,
      additives: additives,
      allergySubstances: allergySubstances,
    );
  }

  
}
