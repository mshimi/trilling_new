import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:trilling_web/features/product_feature/domain/entities/packung.dart';

class PackungModel extends Equatable {
  String name;
  double value;
  PackungModel({
    required this.name,
    required this.value,
  });

  PackungModel copyWith({
    String? name,
    double? value,
  }) {
    return PackungModel(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
    };
  }

  factory PackungModel.fromMap(Map<String, dynamic> map) {
    return PackungModel(
      name: map['name'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PackungModel.fromJson(String source) =>
      PackungModel.fromMap(json.decode(source));

  @override
  String toString() => 'PackungModel(name: $name, value: $value)';

  @override
  List<Object> get props => [name, value];

  factory PackungModel.fromDomain(Packung packung) {
    return PackungModel(name: packung.name, value: packung.value);
  }

  Packung toDomain() {
    return Packung(name: name, value: value);
  }
}
