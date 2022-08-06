// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import 'package:trilling_web/features/client_feature/data/models/adresse_model.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';

import '../../domain/entities/adresse.dart';

class ClientModel {
  String name;
  String firstName;
  String id;
  AdresseModel clientAdresse;
  List<AdresseModel>? deliveryAdresse;
  String createdBy;
  String createdOn;
  String city;
  String district;
  ClientModel({
    
    required this.name,
    required this.firstName,
    required this.id,
    required this.clientAdresse,
    this.deliveryAdresse,
    required this.createdBy,
    required this.createdOn,
    required this.city,
    required this.district
  });

  ClientModel copyWith({
    String? name,
    String? firstName,
    String? id,
    AdresseModel? clientAdresse,
    List<AdresseModel>? deliveryAdresse,
    String? createdBy,
    String? createdOn,
    String? city,
    String? district,
  }) {
    return ClientModel(
      name: name ?? this.name,
      firstName: firstName ?? this.firstName,
      id: id ?? this.id,
      clientAdresse: clientAdresse ?? this.clientAdresse,
      deliveryAdresse: deliveryAdresse ?? this.deliveryAdresse,
      createdBy: createdBy ?? this.createdBy,
      createdOn: createdOn ?? this.createdOn,
      city: city ?? this.city,
      district: district ?? this.district,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'firstName': firstName,
      'id': id,
      'clientAdresse': clientAdresse.toMap(),
      'deliveryAdresse': deliveryAdresse?.map((x) => x.toMap()).toList(),
      'createdBy': createdBy,
      'createdOn': createdOn,
      'city': city,
      'district': district,
    };
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) =>
      ClientModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ClientModel(name: $name, firstName: $firstName, id: $id, clientAdresse: $clientAdresse, deliveryAdresse: $deliveryAdresse, createdBy: $createdBy, createdOn: $createdOn,city: $city,district: $district )';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ClientModel &&
      other.name == name &&
      other.firstName == firstName &&
      other.id == id &&
      other.clientAdresse == clientAdresse &&
      listEquals(other.deliveryAdresse, deliveryAdresse) &&
      other.createdBy == createdBy &&
      other.createdOn == createdOn &&
      other.city == city &&
      other.district == district;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      firstName.hashCode ^
      id.hashCode ^
      clientAdresse.hashCode ^
      deliveryAdresse.hashCode ^
      createdBy.hashCode ^
      createdOn.hashCode ^
      city.hashCode ^
      district.hashCode;
  }

  factory ClientModel.fromDomain(Client client) {
    List<AdresseModel> deliveryAdressetfromDomain = [];
    if (client.deliveryAdresse != null) {
      client.deliveryAdresse!.map((Adresse adresse) =>
          deliveryAdressetfromDomain.add(AdresseModel.fromDomain(adresse)));
    }
    return ClientModel(
        name: client.name,
        firstName: client.firstName,
        id: client.id,
        clientAdresse: AdresseModel.fromDomain(client.clientAdresse),
        createdBy: client.createdBy,
        createdOn: client.createdOn,
        deliveryAdresse: deliveryAdressetfromDomain, city: client.clientAdresse.city, district: client.clientAdresse.city);
  }

  Client toDomain() {
    List<Adresse> deliveryAdressetoDomain = [];
    if (deliveryAdresse != null) {
      deliveryAdresse!.map((AdresseModel adresseModel) =>
          deliveryAdressetoDomain.add(adresseModel.toDomain()));
    }

    return Client(
        firstName: firstName,
        name: name,
        id: id,
        deliveryAdresse: deliveryAdressetoDomain,
        clientAdresse: clientAdresse.toDomain(),
        createdBy: createdBy,
        createdOn: createdOn);
  }

 

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      name: map['name'] ?? '',
      firstName: map['firstName'] ?? '',
      id: map['id'] ?? '',
      clientAdresse: AdresseModel.fromMap(map['clientAdresse']),
      deliveryAdresse: map['deliveryAdresse'] != null ? List<AdresseModel>.from(map['deliveryAdresse']?.map((x) => AdresseModel.fromMap(x))) : null,
      createdBy: map['createdBy'] ?? '',
      createdOn: map['createdOn'] ?? '',
      city: map['city'] ?? '',
      district: map['district'] ?? '',
    );
  }
}
