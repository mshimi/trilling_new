import 'package:dartz/dartz.dart';
import 'package:trilling_web/features/order_feature/data/models/order_model.dart';
import 'package:trilling_web/features/order_feature/domain/repositories/order_repository.dart';

import '../../../../core/failures/store_failure.dart';

class GetCancelledOrdersUseCase {
  final OrderRepository orderRepository;

  GetCancelledOrdersUseCase({required this.orderRepository});

  Future<Either<Failure, List<OrderModel>>> call() async {
    return await orderRepository.getCancelledOrders();
  }
}
