part of 'products_bloc.dart';

abstract class ProductState<Type> extends Equatable {
  SearchOptions currentSearchOptions;

  ProductState({this.currentSearchOptions = SearchOptions.name});

  @override
  List<Object> get props => [currentSearchOptions];

  SearchOptions get searchOption {
    return currentSearchOptions;
  }

  set searchOption(SearchOptions searchOptions) {
    this.currentSearchOptions = searchOptions;
  }

  ProductState copywith({SearchOptions? searchOptions});
}

class ProductInitial extends ProductState {
  ProductInitial({super.currentSearchOptions});

  @override
  set searchOption(SearchOptions searchOptions) {
    this.searchOption = searchOptions;
  }

  @override
  ProductState copywith({SearchOptions? searchOptions}) {
    return ProductInitial(
        currentSearchOptions: searchOptions ?? currentSearchOptions);
  }
}

class SearchOptionChangedState extends ProductState {
  SearchOptionChangedState({required super.currentSearchOptions});

  @override
  set searchOption(SearchOptions searchOptions) {
    searchOption = searchOptions;
    super.currentSearchOptions = searchOptions;
  }

  @override
  ProductState copywith({SearchOptions? searchOptions}) {
    return SearchOptionChangedState(
        currentSearchOptions: searchOptions ?? currentSearchOptions);
  }
}

enum SearchOptions {
  name,
  id,
  price,
  kategorie,
  minPax,
  allergene,
  zusatzstoffe
}
