import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductEvent, ProductState> {
  ProductsBloc() : super(ProductInitial()) {
    on<SearchOptionChangedEvent>((event, emit) {
      SearchOptionChangedState searchOptionChangedState = state;
      emit(SearchOptionChangedState(currentSearchOptions: event.searchOptions));
    });
  }
}
