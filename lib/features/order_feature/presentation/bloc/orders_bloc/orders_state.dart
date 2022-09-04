part of 'orders_bloc.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

class OrdersInitial extends OrdersState {}

class OrdersLoadedSuccesfulSate extends OrdersState {
  List<OrderItem.Order> orders;
  OrdersLoadedSuccesfulSate({required this.orders});
    @override
  List<Object> get props => [orders];
}
