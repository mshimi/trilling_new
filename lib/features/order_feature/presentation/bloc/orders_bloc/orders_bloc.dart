import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/features/order_feature/data/models/order_model.dart';
import 'package:trilling_web/features/order_feature/domain/entities/order.dart'
    as OrderItem;
import 'package:trilling_web/features/order_feature/domain/usecases/get_all_order_by_day.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  GetAllOrdersByDayUseCase getAllOrdersByDayUseCase;
  OrdersBloc({required this.getAllOrdersByDayUseCase})
      : super(OrdersInitial()) {
    on<GetFutureOrdersEvent>((event, emit) async {
      final today = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      );
      Either<Failure, List<OrderModel>> failureOrOrderModel =
          await getAllOrdersByDayUseCase.call(
              dateTime: today.subtract(Duration(days: 50)));

      failureOrOrderModel.fold((l) => print('failure'), (orderModels) {
        orders = orderModels.map((e) => e.toDomain()).toList();
        emit(OrdersLoadedSuccesfulSate(orders: orders));
      });
    });
  }

  List<OrderItem.Order> orders = [];
}
