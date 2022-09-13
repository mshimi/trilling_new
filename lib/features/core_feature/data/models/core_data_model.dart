import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:trilling_web/features/core_feature/data/models/city_model.dart';
import 'package:trilling_web/features/core_feature/data/models/district_model.dart';
import 'package:trilling_web/features/core_feature/data/models/product_category_model.dart';
import 'package:trilling_web/features/core_feature/domain/entities/city.dart';
import 'package:trilling_web/features/core_feature/domain/entities/core_data.dart';
import 'package:trilling_web/features/product_feature/data/models/packung_model.dart';

class CoreDataModel {
  List<CityModel> cities;
  List<ProductCategoryModel> categories;
  List<PackungModel> packungen;
  List<String> zusatzstoffe;
  List<String> allergene;
  CoreDataModel(
      {required this.cities,
      required this.categories,
      required this.packungen,
      required this.allergene,
      required this.zusatzstoffe});

  factory CoreDataModel.fromDomain(CoreData coreData) {
    return CoreDataModel(
        categories: coreData.categories
            .map((e) => ProductCategoryModel.fromDomain(e))
            .toList(),
        cities: coreData.cities.map((e) => CityModel.fromDomain(e)).toList(),
        packungen:
            coreData.packungen.map((e) => PackungModel.fromDomain(e)).toList(),
        allergene: coreData.allergene,
        zusatzstoffe: coreData.zusatzstoffe);
  }

  CoreData toDomain() {
    return CoreData(
        allergene: allergene,
        zusatzstoffe: zusatzstoffe,
        categories: categories.map((e) => e.toDomain()).toList(),
        cities: cities.map((e) => e.toDomain()).toList(),
        packungen: packungen.map((e) => e.toDomain()).toList());
  }

  CoreDataModel copyWith({
    List<CityModel>? cities,
    List<ProductCategoryModel>? categories,
    List<PackungModel>? packungen,
    List<String>? zusatzstoffe,
    List<String>? allergene,
  }) {
    return CoreDataModel(
        cities: cities ?? this.cities,
        categories: categories ?? this.categories,
        packungen: packungen ?? this.packungen,
        zusatzstoffe: zusatzstoffe ?? this.zusatzstoffe,
        allergene: allergene ?? this.allergene);
  }

  Map<String, dynamic> toMap() {
    return {
      'cities': cities.map((x) => x.toMap()).toList(),
      'categories': categories.map((x) => x.toMap()).toList(),
      'packungen': packungen.map((x) => x.toMap()).toList(),
      'zusatzstoffe': zusatzstoffe,
      'allergene': allergene,
    };
  }

  factory CoreDataModel.fromMap(Map<String, dynamic> map) {
    return CoreDataModel(
      cities:
          List<CityModel>.from(map['cities']?.map((x) => CityModel.fromMap(x))),
      categories: List<ProductCategoryModel>.from(
          map['categories']?.map((x) => ProductCategoryModel.fromMap(x))),
      packungen: List<PackungModel>.from(
          map['packungen']?.map((x) => PackungModel.fromMap(x))),
      zusatzstoffe: List<String>.from(map['zusatzstoffe']),
      allergene: List<String>.from(map['allergene']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoreDataModel.fromJson(String source) =>
      CoreDataModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CoreDataModel(cities: $cities, categories: $categories, packungen: $packungen)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoreDataModel &&
        listEquals(other.cities, cities) &&
        listEquals(other.categories, categories) &&
        listEquals(other.allergene, allergene) &&
        listEquals(other.zusatzstoffe, zusatzstoffe) &&
        listEquals(other.packungen, packungen);
  }

  @override
  int get hashCode =>
      cities.hashCode ^ categories.hashCode ^ packungen.hashCode;

  List<DistrictModel> getAllDistricts() {
    List<DistrictModel> allDistricts = [];
    cities.forEach((element) {
      allDistricts.addAll(element.districts);
    });

    return allDistricts;
  }

  List<String> getAllDistrictsNames() {
    List<String> allDistricts = [];
    cities.forEach((element) {
      allDistricts.addAll(element.districts.map((e) => e.name).toList());
    });

    return allDistricts;
  }

  List<String> getAllDistrictsNamesForCity(CityModel cityModel) {
    return cityModel.districts.map((e) => e.name).toList();
  }

  City getCurrentCity(String cityName) {
    City city = cities[0].toDomain();
    for (var i = 0; i < cities.length; i++) {
      if (cities[i].name == cityName) {
        city = cities[i].toDomain();
        break;
      }
    }
    return city;
  }
}
