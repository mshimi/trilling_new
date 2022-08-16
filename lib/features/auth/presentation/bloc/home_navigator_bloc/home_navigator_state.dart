part of 'home_navigator_bloc.dart';

abstract class HomeNavigatorState extends Equatable {
  const HomeNavigatorState();

  @override
  List<Object> get props => [];
}

class HomeNavigatorInitial extends HomeNavigatorState {}

class IndexChangeState extends HomeNavigatorState {
final  int index;

 const IndexChangeState({required this.index});

  @override
  List<Object> get props => [index];
}
