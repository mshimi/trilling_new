part of 'new_client_bloc.dart';

abstract class NewClientEvent extends Equatable {
  const NewClientEvent();

  @override
  List<Object> get props => [];
}

class InputValueChanged extends NewClientEvent {
  String? email;
  String? password;
  String? name;
  String? firstName;

  InputValueChanged({this.email, this.firstName, this.name, this.password});
  @override
  List<Object> get props => [];
}

class AuftragsGeberChanged extends NewClientEvent {
  final String auftragsgeberType;
  const AuftragsGeberChanged({required this.auftragsgeberType});
  @override
  List<Object> get props => [auftragsgeberType];
}

class CityChanged extends NewClientEvent {
  final String cityName;
  const CityChanged({required this.cityName});
  @override
  List<Object> get props => [cityName];
}

class DistrictChanged extends NewClientEvent {
  final String districtName;
  const DistrictChanged({required this.districtName});
  @override
  List<Object> get props => [districtName];
}

class IsClientAdresseLiferAdresseChanged extends NewClientEvent {
  bool isClientAdresseLiferAdresse;

  IsClientAdresseLiferAdresseChanged(
      {required this.isClientAdresseLiferAdresse});
  @override
  List<Object> get props => [isClientAdresseLiferAdresse];
}

class AddClientButtonEvent extends NewClientEvent {
  Client client;
  AddClientButtonEvent({required this.client});
  List<Object> get props => [client];
}
