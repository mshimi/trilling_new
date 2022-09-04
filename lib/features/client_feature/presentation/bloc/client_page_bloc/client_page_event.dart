part of 'client_page_bloc.dart';

abstract class ClientPageEvent extends Equatable {
  const ClientPageEvent();

  @override
  List<Object> get props => [];
}

class GetClientByIdEvent extends ClientPageEvent {
  String clientId;

  GetClientByIdEvent({required this.clientId});

  @override
  List<Object> get props => [clientId];
}

class GetClientFromPage extends ClientPageEvent {
  Client client;

  GetClientFromPage({required this.client});

  @override
  List<Object> get props => [client];
}

class GetClientOrderEvent extends ClientPageEvent {
  String clientId;
  GetClientOrderEvent({required this.clientId});
  @override
  List<Object> get props => [clientId];
}

class EnableEditingClientInformationEvent extends ClientPageEvent {
  bool isEnabled;

  EnableEditingClientInformationEvent({required this.isEnabled});

  @override
  List<Object> get props => [isEnabled];
}

class UpdateClientInformationEvent extends ClientPageEvent {
  Client oldClientData;

  UpdateClientInformationEvent({required this.oldClientData});

  @override
  List<Object> get props => [oldClientData];
}

class CityChangedEvent extends ClientPageEvent {
  String city;
  CoreData coreData;

  CityChangedEvent({required this.city, required this.coreData});

  @override
  List<Object> get props => [city];
}
