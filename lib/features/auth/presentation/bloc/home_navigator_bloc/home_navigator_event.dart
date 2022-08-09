part of 'home_navigator_bloc.dart';

abstract class HomeNavigatorEvent extends Equatable {
  const HomeNavigatorEvent();

  @override
  List<Object> get props => [];
}

class IndexChangeEvent extends HomeNavigatorEvent {
  int index;

  IndexChangeEvent({ required this.index});
}
