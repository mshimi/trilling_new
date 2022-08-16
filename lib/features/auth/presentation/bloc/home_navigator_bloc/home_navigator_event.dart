part of 'home_navigator_bloc.dart';

abstract class HomeNavigatorEvent extends Equatable {
  const HomeNavigatorEvent();

  @override
  List<Object> get props => [];
}

class IndexChangeEvent extends HomeNavigatorEvent {
 final int index;

 const IndexChangeEvent({ required this.index});
}
