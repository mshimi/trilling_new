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

class EnableEditingClientInformationEvent extends ClientPageEvent {
   bool isEnabled;

  EnableEditingClientInformationEvent({required this.isEnabled});

    @override
  List<Object> get props => [isEnabled];
}
