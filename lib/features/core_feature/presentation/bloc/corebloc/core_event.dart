part of 'core_bloc.dart';

abstract class CoreEvent extends Equatable {
  const CoreEvent();

  @override
  List<Object> get props => [];
}

class GetCoreDataEvent extends CoreEvent {}

class CityIndexChanged extends CoreEvent {
  int index;

  CityIndexChanged({required this.index});
  @override
  List<Object> get props => [index];
}

class DistrictDeletedEvent extends CoreEvent {
  int districtIndex;
  DistrictDeletedEvent({required this.districtIndex});

  @override
  List<Object> get props => [districtIndex];
}

class DistrictChangedEvent extends CoreEvent {
  int districtIndex;
  double transferPrice;
  DistrictChangedEvent(
      {required this.districtIndex, required this.transferPrice});
  @override
  List<Object> get props => [districtIndex, transferPrice];
}

class AddNewDistrictEvent extends CoreEvent {
  AddNewDistrictEvent();
  @override
  List<Object> get props => [];
}

class ValidateNewDistrictValuesAndUpdateCoreDataEvent extends CoreEvent {
  final int index;
  final District district;
  ValidateNewDistrictValuesAndUpdateCoreDataEvent(
      {required this.district, required this.index});
  @override
  List<Object> get props => [district, index];
}
