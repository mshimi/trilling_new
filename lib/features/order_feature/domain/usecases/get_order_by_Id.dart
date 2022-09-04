import 'package:dartz/dartz.dart';
import 'package:trilling_web/features/order_feature/data/models/order_model.dart';
import 'package:trilling_web/features/order_feature/domain/repositories/order_repository.dart';

import '../../../../core/failures/store_failure.dart';

class GetOrderByIdUseCase {
  final OrderRepository orderRepository;

  GetOrderByIdUseCase({required this.orderRepository});

  Future<Either<Failure, OrderModel>> call({required String orderId}) async {
    return await orderRepository.getOrderbyId(orderId: orderId);
  }
}
