part of 'core_bloc.dart';

abstract class CoreState extends Equatable {
  const CoreState();

  @override
  List<Object> get props => [];
}

class CoreInitial extends CoreState {}

class CityIndexChangedState extends CoreState {
  int index;

  CityIndexChangedState({required this.index});

  @override
  List<Object> get props => [index];
}

class AddNewDistrictState extends CoreState {}

class DistrictUpdatedState extends CoreState {
  final int districtIndex;

  DistrictUpdatedState({required this.districtIndex});

    @override
  List<Object> get props => [districtIndex];
}
