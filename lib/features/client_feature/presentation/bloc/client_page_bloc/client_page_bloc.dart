import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';
import 'package:trilling_web/features/client_feature/domain/usecases/get_client_by_id.dart';

part 'client_page_event.dart';
part 'client_page_state.dart';

class ClientPageBloc extends Bloc<ClientPageEvent, ClientPageState> {
  final GetClientsByIdUseCase getClientsByIdUseCase;

  ClientPageBloc({
    required this.getClientsByIdUseCase,
  }) : super(ClientPageInitial()) {
    on<GetClientByIdEvent>((event, emit) async {
      var eitherFailureOrClient =
          await getClientsByIdUseCase.call(keyword: event.clientId);

      eitherFailureOrClient.fold(
        (failure) {},
        (clientModel) {
          Client client = clientModel.toDomain();
          this.client = client;
          emit(GetClientSucessState(client: client));
        },
      );
    });

    on<EnableEditingClientInformationEvent>((event, emit) {
      event.isEnabled = isEnabled;
      emit(ClientInformationEditableChangeState(isEditable: event.isEnabled));
    });
  }

  Client? client;
  bool isEnabled = false;
}
