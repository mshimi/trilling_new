part of 'new_client_bloc.dart';

abstract class NewClientState extends Equatable {
  const NewClientState();

  @override
  List<Object> get props => [];
}

class NewClientInitial extends NewClientState {}

class ValidInputsState extends NewClientState {
  String value;

  ValidInputsState({required this.value});
}
