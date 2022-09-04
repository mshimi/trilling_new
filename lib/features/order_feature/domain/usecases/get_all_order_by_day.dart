import 'package:dartz/dartz.dart';
import 'package:trilling_web/features/order_feature/data/models/order_model.dart';
import 'package:trilling_web/features/order_feature/domain/repositories/order_repository.dart';

import '../../../../core/failures/store_failure.dart';

class GetAllOrdersByDayUseCase {
  final OrderRepository orderRepository;

  GetAllOrdersByDayUseCase({required this.orderRepository});

  Future<Either<Failure, List<OrderModel>>> call(
      {required DateTime dateTime}) async {
    
    return await orderRepository.getAllOrdersGreaterThanDay(dateTime: dateTime);
  }
}
