import 'package:dartz/dartz.dart';
import 'package:trilling_web/features/order_feature/data/models/order_model.dart';
import 'package:trilling_web/features/order_feature/domain/repositories/order_repository.dart';

import '../../../../core/failures/store_failure.dart';

class UpdateAnOrderUseCase {
  final OrderRepository orderRepository;

  UpdateAnOrderUseCase({required this.orderRepository});

  Future<Either<Failure, OrderModel>> call(
      {required OrderModel orderModel}) async {
    return await orderRepository.updateAnOrder(orderModel: orderModel);
  }
}
