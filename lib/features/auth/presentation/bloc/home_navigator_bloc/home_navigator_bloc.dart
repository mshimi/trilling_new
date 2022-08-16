import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:trilling_web/features/client_feature/presentation/pages/client_page.dart';

part 'home_navigator_event.dart';
part 'home_navigator_state.dart';

class HomeNavigatorBloc extends Bloc<HomeNavigatorEvent, HomeNavigatorState> {
  HomeNavigatorBloc() : super(HomeNavigatorInitial()) {
    on<IndexChangeEvent>((event, emit) {
      currentIndex = event.index;
      emit(IndexChangeState(index: currentIndex));
    });
  }

  List sideMenuList = [
    {
      'text': 'Home',
      'icon': Icons.home,
      'page':const Placeholder(),
    },
    {
      'text': 'Kunden',
      'icon': Icons.people,
      'page':const ClientPage(),
    },
    {
      'text': 'Product',
      'icon': Icons.shopping_cart_rounded,
      'page':const Placeholder()
    },
  ];

  int currentIndex = 0;
}
