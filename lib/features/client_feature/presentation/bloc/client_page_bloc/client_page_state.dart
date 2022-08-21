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

class ClientInformationEditableChangeState extends ClientPageState {
  bool isEditable;

  ClientInformationEditableChangeState({required this.isEditable});
   @override
  List<Object> get props => [isEditable];
}
