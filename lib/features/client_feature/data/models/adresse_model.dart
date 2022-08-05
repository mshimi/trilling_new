import 'package:trilling_web/features/client_feature/domain/entities/adresse.dart';

class AdresseModel {
  String city;
  int zipCode;
  String district;
  String houseNumber;
  String street;

  AdresseModel(
      {required this.city,
      required this.zipCode,
      required this.district,
      required this.houseNumber, required this.street});

  AdresseModel copyWith({
    String? city,
    int? zipCode,
    String? district,
    String? houseNumber,
    String? street,
  }) {
    return AdresseModel(
        city: city ?? this.city,
        zipCode: zipCode ?? this.zipCode,
        district: district ?? this.district,
        houseNumber: houseNumber ?? this.houseNumber, 
        street:  street ?? this.street);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city,
      'zipCode': zipCode,
      'district': district,
      'houseNumber': houseNumber,
      'street' : street,
    };
  }

  factory AdresseModel.fromMap(Map<String, dynamic> map) {
    return AdresseModel(
      city: map['city'] as String,
      zipCode: map['zipCode'] as int,
      district: map['district'] as String,
      houseNumber: map['houseNumber'] as String,
      street: map['street'] as String,
    );
  }

  factory AdresseModel.fromDomain(Adresse adresse) {
    return AdresseModel(
        city: adresse.city,
        zipCode: adresse.zipCode,
        district: adresse.district,
        houseNumber: adresse.houseNumber,
        street: adresse.street);
  }

  Adresse toDomain() {
    return Adresse(
        city: city,
        district: district,
        zipCode: zipCode,
        houseNumber: houseNumber,
        street: street);
  }
}
