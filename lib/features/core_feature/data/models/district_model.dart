import 'dart:convert';

import 'package:trilling_web/features/core_feature/domain/entities/district.dart';

class DistrictModel {
  String name;
  double transferPrice;
  DistrictModel({
    required this.name,
    required this.transferPrice,
  });

  factory DistrictModel.fromDomain(District district) {
    return DistrictModel(
        name: district.name.toLowerCase(),
        transferPrice: district.transferPrice);
  }

  District toDomain() {
    return District(
        name: '${name[0].toUpperCase()}${name.substring(1)}',
        transferPrice: transferPrice);
  }

  DistrictModel copyWith({
    String? name,
    double? transferPrice,
  }) {
    return DistrictModel(
      name: name ?? this.name,
      transferPrice: transferPrice ?? this.transferPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'transferPrice': transferPrice,
    };
  }

  factory DistrictModel.fromMap(Map<String, dynamic> map) {
    return DistrictModel(
      name: map['name'] ?? '',
      transferPrice: map['transferPrice']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DistrictModel.fromJson(String source) =>
      DistrictModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'DistrictModel(name: $name, transferPrice: $transferPrice)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DistrictModel &&
        other.name == name &&
        other.transferPrice == transferPrice;
  }

  @override
  int get hashCode => name.hashCode ^ transferPrice.hashCode;
}
