import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/features/order_feature/data/models/order_model.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<OrderModel>>> getClientOrders(
      {required String clientId});

  Future<Either<Failure, OrderModel>> addNewOrder(
      {required String clientId, required OrderModel orderModel});

  Future<Either<Failure, OrderModel>> updateAnOrder({required OrderModel orderModel});

  Future<Either<Failure, List<OrderModel>>> getAllOrdersGreaterThanDay(
      {required DateTime dateTime});

  Future<Either<Failure, List<OrderModel>>> getUndeliveredOrders();

  
  Future<Either<Failure, List<OrderModel>>> getUnCollectedOrders();

  Future<Either<Failure, List<OrderModel>>> getUnPaidOrders();

  Future<Either<Failure, List<OrderModel>>> getCancelledOrders();

  Future<Either<Failure, List<OrderModel>>> getReadyOrders();

  Future<Either<Failure, List<OrderModel>>> getOrdersPerBookingDate(
      {required DateTime bookingsDate, required Duration duration });

  Future<Either<Failure, List<OrderModel>>> getOrdersDuringPeriod(
      {required DateTime startDays, required Duration duration});

  Future<Either<Failure, OrderModel>> getOrderbyId({required String orderId});
}
