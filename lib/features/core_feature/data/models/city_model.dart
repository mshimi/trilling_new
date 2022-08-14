import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:trilling_web/features/core_feature/data/models/district_model.dart';
import 'package:trilling_web/features/core_feature/domain/entities/city.dart';
import 'package:trilling_web/features/core_feature/domain/entities/district.dart';

class CityModel {
  String name;
  List<DistrictModel> districts;
  CityModel({
    required this.name,
    required this.districts,
  });

  factory CityModel.fromDomain(City city) {
    return CityModel(
        name: city.name.toLowerCase(),
        districts:
            city.districts.map((e) => DistrictModel.fromDomain(e)).toList());
  }

  City toDomain() {
    return City(name: '${name[0].toUpperCase()}${name.substring(1)}', districts: districts.map((e) => e.toDomain()).toList());
  }

  CityModel copyWith({
    String? name,
    List<DistrictModel>? districts,
  }) {
    return CityModel(
      name: name ?? this.name,
      districts: districts ?? this.districts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'districts': districts.map((x) => x.toMap()).toList(),
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      name: map['name'] ?? '',
      districts: List<DistrictModel>.from(
          map['districts']?.map((x) => DistrictModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(json.decode(source));

  @override
  String toString() => 'CityModel(name: $name, districts: $districts)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CityModel &&
        other.name == name &&
        listEquals(other.districts, districts);
  }

  @override
  int get hashCode => name.hashCode ^ districts.hashCode;
}
