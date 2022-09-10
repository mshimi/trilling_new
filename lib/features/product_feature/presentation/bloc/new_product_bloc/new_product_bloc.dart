import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_product_event.dart';
part 'new_product_state.dart';

class NewProductBloc extends Bloc<NewProductEvent, NewProductState> {
  NewProductBloc() : super(NewProductInitial()) {
    on<NewProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
