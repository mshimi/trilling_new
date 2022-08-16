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

