import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/products_page_widgts/searchoptions_checkbox.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductEvent, ProductState> {
  ProductsBloc() : super(ProductInitial()) {
    on<SearchOptionChangedEvent>((event, emit) {
      emit(SearchOptionChangedState(currentSearchOptions: event.searchOptions));
    });
  }
}
