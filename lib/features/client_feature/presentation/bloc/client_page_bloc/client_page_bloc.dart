import 'package:flutter/cupertino.dart';
import 'package:trilling_web/features/client_feature/export.dart';

part 'client_page_event.dart';
part 'client_page_state.dart';

class ClientPageBloc extends Bloc<ClientPageEvent, ClientPageState> {
  final AddNewClientUseCase addNewClientUseCase;
  final GetAllClientsUseCase getAllClientsUseCase;
  final GetClientsByCityUseCase getClientsByCityUseCase;
  final GetClientsByDistrictUseCase getClientsByDistrictUseCase;
  final GetClientsByFirstNameUseCase getClientsByFirstNameUseCase;
  final GetClientsByIdUseCase getClientsByIdUseCase;
  final GetClientsByNameUseCase getClientsByNameUseCase;

  ClientPageBloc(
      {required this.addNewClientUseCase,
      required this.getAllClientsUseCase,
      required this.getClientsByCityUseCase,
      required this.getClientsByDistrictUseCase,
      required this.getClientsByFirstNameUseCase,
      required this.getClientsByIdUseCase,
      required this.getClientsByNameUseCase})
      : super(ClientPageInitial()) {
    on<GetSearchByEvent>((event, emit) {
      searchby = event.searchby;

      emit(GetSearchByChangedState(searchBy: searchby));
    });

    on<SearchClientEvent>((event, emit) {
      if (event.searchKey.length > 3) {
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
            add(event);
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
        (l) {},
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
          await getClientsByCityUseCase.call(keyword: event.searchKey);

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
          await getClientsByDistrictUseCase.call(keyword: event.searchKey);

      eitherValueOrFailure.fold(
        (l) {},
        (r) {
          clients = r.map((e) => e.toDomain()).toList();
          emit(ClientNewSearchDataState(clients: clients));
        },
      );
    });
  }

  List<Client> clients = [];
  List<Client> tableContent = [];
  String searchby = 'Name';
  TextEditingController searchController = TextEditingController();
}
