part of 'new_client_bloc.dart';

enum AuftragsgeberType { privat, firma }

extension on AuftragsgeberType {
  AuftragsgeberType fromString(String value) {
    switch (value) {
      case 'privat':
        return AuftragsgeberType.privat;

      default:
        return AuftragsgeberType.firma;
    }
  }
}

class NewClientState extends Equatable {
  final AuftragsgeberType auftragsgeberType;
  final String? name;
  final String? firstName;
  String? selectedCity;
  String? selectedDistrict;
  final String? telephone;
  final String? email;
  final bool isClientAdresseLiferAdresse;
  List<Adresse> listOfDelivaryAdresses = [];
  NewClientState({
    this.selectedCity,
    this.auftragsgeberType = AuftragsgeberType.privat,
    this.email,
    this.firstName,
    this.name,
    this.telephone,
    this.selectedDistrict,
    this.isClientAdresseLiferAdresse = true,
  });

  @override
  List<Object> get props => [
        auftragsgeberType,
        selectedCity!,
        selectedDistrict!,
        isClientAdresseLiferAdresse,
        listOfDelivaryAdresses,
      ];

  NewClientState copywith({
    AuftragsgeberType? auftragsgeberType,
    String? name,
    String? firstName,
    String? telephone,
    String? email,
    String? selectedCity,
    String? selectedDistrict,
    bool? isClientAdresseLiferAdresse,
  }) {
    return NewClientState(
      auftragsgeberType: auftragsgeberType ?? this.auftragsgeberType,
      name: name ?? this.name,
      firstName: firstName ?? this.firstName,
      telephone: telephone ?? this.telephone,
      email: email ?? this.email,
      selectedCity: selectedCity ?? this.selectedCity,
      selectedDistrict: selectedDistrict ?? this.selectedDistrict,
      isClientAdresseLiferAdresse:
          isClientAdresseLiferAdresse ?? this.isClientAdresseLiferAdresse,
    );
  }
}

class ClientRegestredState extends NewClientState {
  Client client;
  ClientRegestredState({required this.client});

  @override
  List<Object> get props => [client];
}
