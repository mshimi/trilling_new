import 'package:flutter/material.dart';

import 'package:trilling_web/features/client_feature/domain/usecases/update_client_data.dart';
import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/core_feature/domain/entities/core_data.dart';

import 'package:trilling_web/features/order_feature/data/models/order_model.dart';
import 'package:trilling_web/features/order_feature/domain/entities/order.dart'
    as clientorder;
import 'package:trilling_web/features/order_feature/domain/usecases/get_orders_by_client.dart';



part 'client_page_event.dart';
part 'client_page_state.dart';

class ClientPageBloc extends Bloc<ClientPageEvent, ClientPageState> {
  final GetClientsByIdUseCase getClientsByIdUseCase;
  final GetOrdersByClientUseCase getOrdersByClientUseCase;
  final UpdateClientDataUseCase updateClientDataUseCase;

  ClientPageBloc(
      {required this.getOrdersByClientUseCase,
      required this.getClientsByIdUseCase,
      required this.updateClientDataUseCase})
      : super(ClientPageInitial()) {
    on<GetClientByIdEvent>((event, emit) async {
      var eitherFailureOrClient =
          await getClientsByIdUseCase.call(keyword: event.clientId);

      eitherFailureOrClient.fold(
        (failure) {},
        (clientModel) async {
          Client client = clientModel.toDomain();
          this.client = client;
          district = client.clientAdresse.district;
          city = client.clientAdresse.city;

          add(GetClientOrderEvent(clientId: client.id));
          emit(GetClientSucessState(client: client));
        },
      );
    });

    on<GetClientFromPage>((event, emit) {
      client = event.client;
      emit(GetClientSucessState(client: client!));
    });

    on<GetClientOrderEvent>((event, emit) async {
      Either<Failure, List<OrderModel>> eitherFailureOrOrders =
          await getOrdersByClientUseCase.call(clientId: event.clientId);

      eitherFailureOrOrders.fold((l) => null, (r) {
        orders = r.map((e) => e.toDomain()).toList();
        emit(GetClientOrdersSucessState(order: orders));
      });
    });

    on<EnableEditingClientInformationEvent>((event, emit) {
      event.isEnabled = isEnabled;
      emit(ClientInformationEditableChangeState(isEditable: event.isEnabled));
    });

    on<UpdateClientInformationEvent>((event, emit) async {
      Adresse clientAdresse = Adresse(
          city: city,
          district: district,
          zipCode: int.parse(zipCodeController.text),
          houseNumber: housNumberController.text,
          street: streetController.text);
      Client newClient = Client(
          clientAdresse: clientAdresse,
          createdBy: event.oldClientData.createdBy,
          createdOn: event.oldClientData.createdOn,
          name: nameController.text,
          firstName: firstNameController.text,
          telephone: telephoneController.text,
          email: emailController.text,
          id: event.oldClientData.id);

      if (event.oldClientData == newClient) {
      } else {
        var eitherFailureOrUnit = await updateClientDataUseCase.call(
            clientModel: ClientModel.fromDomain(newClient));

        eitherFailureOrUnit.fold(
          (l) => null,
          (r) {
            client = newClient;
            isEnabled = false;
            emit(ClientDataUpdatedState(client: client!));
          },
        );
      }
    });

    on<CityChangedEvent>((event, emit) {
      city = event.city;

      client!.clientAdresse.city = event.city;

      emit(CityChangeState(city: city));
    });
  }

  Client? client;
  List<clientorder.Order> orders = [];
  bool isEnabled = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController housNumberController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController cityCodeController = TextEditingController();
  String city = ' ';
  String district = ' ';
  
}
