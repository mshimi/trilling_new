
import 'package:equatable/equatable.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';



abstract class ClientPageState extends Equatable {
  const ClientPageState();

  @override
  List<Object> get props => [];
}

class GetSearchByChangedState extends ClientPageState {
  String searchBy;
  GetSearchByChangedState({required this.searchBy});
  @override
  List<Object> get props => [searchBy];
}

class ClientPageInitial extends ClientPageState {}

class ClientNewSearchDataState extends ClientPageState {
  final List<Client> clients;

  const ClientNewSearchDataState({required this.clients});
  @override
  List<Object> get props => [clients];
}

class ClientInternalSearchDataState extends ClientPageState {
  final List<Client> clients;

  const ClientInternalSearchDataState({required this.clients});
  @override
  List<Object> get props => [clients];
}

class UnValidSearchKeyState extends ClientPageState {}
