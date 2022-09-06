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
  AuftragsGeberChanged({required this.auftragsgeberType});
@override
  List<Object> get props => [auftragsgeberType];

}
