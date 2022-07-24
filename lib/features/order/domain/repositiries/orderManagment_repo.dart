import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/features/client_mangement/domain/entities/client.dart';
import 'package:trilling_web/features/order/domain/entities/order.dart'
    as order;

abstract class OrderMangament_Repo {
  addOrder(Client client);
  Future<Either<StoreFailure, List<order.Order>>> getAllOrdersFromClient(
      Client client);
  Future<Either<StoreFailure, List<order.Order>>> getAllOrders();
  getOrdersPerDate(DateTime dateTime);
 Future<Either<StoreFailure, Unit>> cancelOrder(order.Order order);
 Future<Either<StoreFailure, Unit>> updateOrder(order.Order order);
}
