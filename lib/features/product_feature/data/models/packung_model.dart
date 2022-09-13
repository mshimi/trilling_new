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

  String packungValueToSymbole() {
    if (value == 0.25) {
      return '¼';
    } else if (value == 0.50) {
      return '½';
    } else if (value == 0.33) {
      return '⅓';
    } else {
      return '1';
    }
  }

  double packungValueFromSympole(String sympole) {
    if (sympole == '¼') {
      return 0.25;
    } else if (value == '½') {
      return 0.50;
    } else if (value == '⅓') {
      return 0.33;
    } else {
      return 1;
    }
  }
}
