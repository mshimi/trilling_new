import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:trilling_web/features/client_feature/data/models/client_model.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';
import 'package:trilling_web/features/client_feature/domain/repositories/input_validator.dart';
import 'package:trilling_web/features/client_feature/domain/usecases/add_new_client.dart';

import '../../../../../core/failures/store_failure.dart';
import '../../../domain/entities/adresse.dart';

part 'new_client_event.dart';
part 'new_client_state.dart';

class NewClientBloc extends Bloc<NewClientEvent, NewClientState> {
  AddNewClientUseCase addNewClientUseCase;
  final InputValidatorRepository inputValidatorRepository;

  NewClientBloc(
      {required this.inputValidatorRepository,
      required this.addNewClientUseCase})
      : super(NewClientState()) {
    on<InputValueChanged>((event, emit) {
      // Email
      var eitherErorrOrValid =
          inputValidatorRepository.validateEmail(email: event.email);
      eitherErorrOrValid.fold(
          (l) => emialErorrMessage == l, (r) => emialErorrMessage == null);

      // name & firstName still to do
    });

    on<AuftragsGeberChanged>((event, emit) {
      emit(state.copywith(
          auftragsgeberType:
              AuftragsgeberType.values.byName(event.auftragsgeberType)));
    });

    on<CityChanged>((event, emit) {
      emit(
          state.copywith(selectedCity: event.cityName, selectedDistrict: null));
    });
    on<DistrictChanged>((event, emit) {
      emit(state.copywith(selectedDistrict: event.districtName));
    });

    on<IsClientAdresseLiferAdresseChanged>((event, emit) {
      emit(state.copywith(
          isClientAdresseLiferAdresse: event.isClientAdresseLiferAdresse));
    });

    on<AddClientButtonEvent>((event, emit) async {
      Either<Failure, ClientModel> clientOrFailure =
          await addNewClientUseCase.call(client: event.client);

      clientOrFailure.fold((l) => null, (clientModel) =>  emit(ClientRegestredState(client: clientModel.toDomain())));

     
    });
  }

  String? emialErorrMessage;
}
