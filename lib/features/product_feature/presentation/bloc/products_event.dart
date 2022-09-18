part of 'products_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class SearchOptionChangedEvent extends ProductEvent {
  SearchOptions searchOptions;

  SearchOptionChangedEvent({required this.searchOptions});

  @override
  List<Object> get props => [searchOptions];

}
