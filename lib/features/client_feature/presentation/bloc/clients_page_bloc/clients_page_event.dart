


import 'package:equatable/equatable.dart';

abstract class ClientPageEvent extends Equatable {
  const ClientPageEvent();

  @override
  List<Object> get props => [];
}

class GetClientEvent extends ClientPageEvent {
  @override
  List<Object> get props => [];
}

class GetSearchByEvent extends ClientPageEvent {
  final String searchby;

  const GetSearchByEvent({required this.searchby});
  // @override
  // List<Object> get props => [searchby];
}

class SearchClientEvent extends ClientPageEvent {
  final String searchby;
  final String searchKey;

  const SearchClientEvent({required this.searchby, required this.searchKey});

  @override
  List<Object> get props => [searchby, searchKey];
}

class SearchClientbyNameEvent extends ClientPageEvent {
  final String searchKey;
  const SearchClientbyNameEvent({required this.searchKey});

  @override
  List<Object> get props => [searchKey];
}

class SearchClientbyFirstNameEvent extends ClientPageEvent {
  final String searchKey;
  const SearchClientbyFirstNameEvent({required this.searchKey});

  @override
  List<Object> get props => [searchKey];
}

class SearchClientbyCityEvent extends ClientPageEvent {
  final String searchKey;
  const SearchClientbyCityEvent({required this.searchKey});

  @override
  List<Object> get props => [searchKey];
}

class SearchClientbyDistrictEvent extends ClientPageEvent {
  final String searchKey;
  const SearchClientbyDistrictEvent({required this.searchKey});

  @override
  List<Object> get props => [searchKey];
}

class SearchClientbyIdEvent extends ClientPageEvent {
  final String searchKey;
  const SearchClientbyIdEvent({required this.searchKey});

  @override
  List<Object> get props => [searchKey];
}
