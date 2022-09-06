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

  final String? telephone;
  final String? email;
  const NewClientState({
    this.auftragsgeberType = AuftragsgeberType.privat,
    this.email,
    this.firstName,
    this.name,
    this.telephone,
  });

  @override
  List<Object> get props => [auftragsgeberType];

  NewClientState copywith({
    AuftragsgeberType? auftragsgeberType,
    String? name,
    String? firstName,
    String? telephone,
    String? email,
  }) {
    return NewClientState(
      auftragsgeberType: auftragsgeberType ?? this.auftragsgeberType,
      name: name ?? this.name,
      firstName: firstName ?? this.firstName,
      telephone: telephone ?? this.telephone,
      email: email ?? this.email,
    );
  }
}
