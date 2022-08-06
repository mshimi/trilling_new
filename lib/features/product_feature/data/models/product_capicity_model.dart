import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:trilling_web/features/product_feature/data/models/packung_model.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product_capicity.dart';

class ProductCapicityModel extends Equatable {
  int maxPax;
  PackungModel packung;
  ProductCapicityModel({
    required this.maxPax,
    required this.packung,
  });

  ProductCapicityModel copyWith({
    int? maxPax,
    PackungModel? packung,
  }) {
    return ProductCapicityModel(
      maxPax: maxPax ?? this.maxPax,
      packung: packung ?? this.packung,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'maxPax': maxPax,
      'packung': packung.toMap(),
    };
  }

  factory ProductCapicityModel.fromMap(Map<String, dynamic> map) {
    return ProductCapicityModel(
      maxPax: map['maxPax']?.toInt() ?? 0,
      packung: PackungModel.fromMap(map['packung']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCapicityModel.fromJson(String source) =>
      ProductCapicityModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductCapicityModel(maxPax: $maxPax, packung: $packung)';

  @override
  List<Object> get props => [maxPax, packung];

  factory ProductCapicityModel.fromDomain(ProductCapicity productCapicity) {
    return ProductCapicityModel(
        maxPax: productCapicity.maxPax,
        packung: PackungModel.fromDomain(productCapicity.packung));
  }

  ProductCapicity toDomain() {
    return ProductCapicity(maxPax: maxPax, packung: packung.toDomain());
  }


  

}
