part of 'products_bloc.dart';

abstract class ProductState extends Equatable {
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
}

class ProductInitial extends ProductState {
  ProductInitial();

  @override
  set searchOption(SearchOptions searchOptions) {
    this.searchOption = searchOptions;
  }
}

class SearchOptionChangedState extends ProductState {
  SearchOptionChangedState({required super.currentSearchOptions}) {
    print(currentSearchOptions);
  }

  @override
  set searchOption(SearchOptions searchOptions) {
    searchOption = searchOptions;
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
