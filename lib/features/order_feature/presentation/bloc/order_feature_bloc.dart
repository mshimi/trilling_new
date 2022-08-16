import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_feature_event.dart';
part 'order_feature_state.dart';

class OrderFeatureBloc extends Bloc<OrderFeatureEvent, OrderFeatureState> {
  OrderFeatureBloc() : super(OrderFeatureInitial()) {
    on<OrderFeatureEvent>((event, emit) {
    });
  }
}
