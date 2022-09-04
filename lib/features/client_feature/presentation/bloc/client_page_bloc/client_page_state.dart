part of 'client_page_bloc.dart';



abstract class ClientPageState extends Equatable {
  const ClientPageState();

  @override
  List<Object> get props => [];
}

class ClientPageInitial extends ClientPageState {}

class GetClientFailureState extends ClientPageState {}

class GetClientSucessState extends ClientPageState {
  Client client;
  GetClientSucessState({required this.client});

  @override
  List<Object> get props => [client];
}

class GetClientOrdersSucessState extends ClientPageState {
  List<clientorder.Order> order;
  GetClientOrdersSucessState({required this.order});

  @override
  List<Object> get props => [order];
}

class ClientInformationEditableChangeState extends ClientPageState {
  bool isEditable;

  ClientInformationEditableChangeState({required this.isEditable});
  @override
  List<Object> get props => [isEditable];
}

class ClientDataUpdatedState extends ClientPageState {
  Client client;

  ClientDataUpdatedState({required this.client});
  @override
  List<Object> get props => [client];
}


class CityChangeState extends ClientPageState {
  String city;

  CityChangeState({required this.city});
  @override
  List<Object> get props => [city];
}