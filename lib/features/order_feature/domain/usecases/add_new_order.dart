import 'package:dartz/dartz.dart';
import 'package:trilling_web/features/order_feature/data/models/order_model.dart';
import 'package:trilling_web/features/order_feature/domain/repositories/order_repository.dart';

import '../../../../core/failures/store_failure.dart';

class AddNewOrderUseCase {
  final OrderRepository orderRepository;

  AddNewOrderUseCase({required this.orderRepository});

  Future<Either<Failure, OrderModel>> call(
      {required String clientId, required OrderModel orderModel}) async {
    return await orderRepository.addNewOrder(
        clientId: clientId, orderModel: orderModel);
  }
}
