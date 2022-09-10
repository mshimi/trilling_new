import 'package:flutter/cupertino.dart';
import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/client_feature/presentation/bloc/clients_page_bloc/clients_page_state.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';
import 'package:trilling_web/features/client_feature/presentation/bloc/clients_page_bloc/clients_page_event.dart';

class ClientsPageBloc extends Bloc<ClientPageEvent, ClientPageState> {
  final AddNewClientUseCase addNewClientUseCase;
  final GetAllClientsUseCase getAllClientsUseCase;
  final GetClientsByCityUseCase getClientsByCityUseCase;
  final GetClientsByDistrictUseCase getClientsByDistrictUseCase;
  final GetClientsByFirstNameUseCase getClientsByFirstNameUseCase;
  final GetClientsByIdUseCase getClientsByIdUseCase;
  final GetClientsByNameUseCase getClientsByNameUseCase;
  final CoreBloc coreBloc;

  ClientsPageBloc(
      {required this.addNewClientUseCase,
      required this.getAllClientsUseCase,
      required this.getClientsByCityUseCase,
      required this.getClientsByDistrictUseCase,
      required this.getClientsByFirstNameUseCase,
      required this.getClientsByIdUseCase,
      required this.getClientsByNameUseCase,
      required this.coreBloc})
      : super(ClientPageInitial()) {
    on<GetSearchByEvent>((event, emit) {
      searchby = event.searchby;

      emit(GetSearchByChangedState(searchBy: searchby));
    });

    on<SearchClientEvent>((event, emit) {
      if (event.searchKey.length > 3 ||
          event.searchby == 'Stadt' ||
          event.searchby == 'Stadtteil') {
        switch (event.searchby) {
          case 'Name':
            add(SearchClientbyNameEvent(searchKey: event.searchKey));
            break;
          case 'Vorname':
            add(SearchClientbyFirstNameEvent(searchKey: event.searchKey));

            break;
          case 'Stadt':
            add(SearchClientbyCityEvent(searchKey: event.searchKey));
            break;
          case 'Stadtteil':
            add(SearchClientbyDistrictEvent(searchKey: event.searchKey));
            break;

          case 'Id':
            add(SearchClientbyIdEvent(searchKey: event.searchKey));
            break;
          default:
        }
      } else {
        emit(UnValidSearchKeyState());
      }
    });

    on<GetClientEvent>((event, emit) {});

    on<SearchClientbyNameEvent>((event, emit) async {
      Either<Failure, List<ClientModel>> eitherValueOrFailure =
          await getClientsByNameUseCase.call(keyword: event.searchKey);

      eitherValueOrFailure.fold(
        (l) {
        
        },
        (r) {
          clients = r.map((e) => e.toDomain()).toList();
          emit(ClientNewSearchDataState(clients: clients));
        },
      );
    });
    on<SearchClientbyFirstNameEvent>((event, emit) async {
      Either<Failure, List<ClientModel>> eitherValueOrFailure =
          await getClientsByFirstNameUseCase.call(keyword: event.searchKey);

      eitherValueOrFailure.fold(
        (l) {},
        (r) {
          clients = r.map((e) => e.toDomain()).toList();
          emit(ClientNewSearchDataState(clients: clients));
        },
      );
    });

    on<SearchClientbyCityEvent>((event, emit) async {
      Either<Failure, List<ClientModel>> eitherValueOrFailure =
          await getClientsByCityUseCase.call(keyword: selectedCity);

      eitherValueOrFailure.fold(
        (l) {},
        (r) {
          clients = r.map((e) => e.toDomain()).toList();
          emit(ClientNewSearchDataState(clients: clients));
        },
      );
    });
    on<SearchClientbyDistrictEvent>((event, emit) async {
      Either<Failure, List<ClientModel>> eitherValueOrFailure =
          await getClientsByDistrictUseCase.call(keyword: selectedDistrict);

      eitherValueOrFailure.fold(
        (l) {},
        (r) {
          clients = r.map((e) => e.toDomain()).toList();
          emit(ClientNewSearchDataState(clients: clients));
        },
      );
    });

    on<SearchClientbyIdEvent>((event, emit) async {
      Either<Failure, ClientModel> eitherFailureOrClient =
          await getClientsByIdUseCase.call(keyword: event.searchKey);

      eitherFailureOrClient.fold(
        (l) {},
        (r) {
          clients.clear();
          clients.add(r.toDomain());
          emit(ClientNewSearchDataState(clients: clients));
        },
      );
    });
  }

  List<Client> clients = [];
  List<Client> tableContent = [];
  String searchby = 'Name';
  TextEditingController searchController = TextEditingController();

  String selectedCity = '';
  String selectedDistrict = '';
}
