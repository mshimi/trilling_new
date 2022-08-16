import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trilling_web/features/client_feature/domain/repositories/input_validator.dart';

part 'new_client_event.dart';
part 'new_client_state.dart';

class NewClientBloc extends Bloc<NewClientEvent, NewClientState> {
  final InputValidatorRepository inputValidatorRepository;

  NewClientBloc({required this.inputValidatorRepository})
      : super(NewClientInitial()) {
    on<InputValueChanged>((event, emit) {
      // Email
      var eitherErorrOrValid =
          inputValidatorRepository.validateEmail(email: event.email);
      eitherErorrOrValid.fold(
          (l) => emialErorrMessage == l, (r) => emialErorrMessage == null);

      // name & firstName still to do

      emit(ValidInputsState(value: event.email!));

    });
  }

  String? emialErorrMessage;
}
