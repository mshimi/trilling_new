import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:trilling_web/features/core_feature/domain/entities/product_category.dart';

class ProductCategoryModel {
  String name;
  List<String> subCategories;
  ProductCategoryModel({
    required this.name,
    required this.subCategories,
  });

  factory ProductCategoryModel.fromDomain(ProductCategory productCategory) {
    return ProductCategoryModel(
        name: productCategory.name.toLowerCase(),
        subCategories:
            productCategory.subCategories.map((e) => e.toLowerCase()).toList());
  }

  ProductCategory toDomain() {
    return ProductCategory(
        name: '${name[0].toUpperCase()}${name.substring(1)}',
        subCategories: subCategories
            .map((e) => '${e[0].toUpperCase()}${e.substring(1)}')
            .toList());
  }

  ProductCategoryModel copyWith({
    String? name,
    List<String>? subCategories,
  }) {
    return ProductCategoryModel(
      name: name ?? this.name,
      subCategories: subCategories ?? this.subCategories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'subCategories': subCategories,
    };
  }

  factory ProductCategoryModel.fromMap(Map<String, dynamic> map) {
    return ProductCategoryModel(
      name: map['name'] ?? '',
      subCategories: List<String>.from(map['subCategories']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCategoryModel.fromJson(String source) =>
      ProductCategoryModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductCategoryModel(name: $name, subCategories: $subCategories)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductCategoryModel &&
        other.name == name &&
        listEquals(other.subCategories, subCategories);
  }

  @override
  int get hashCode => name.hashCode ^ subCategories.hashCode;
}
