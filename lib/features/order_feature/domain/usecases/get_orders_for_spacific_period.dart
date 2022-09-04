import 'package:dartz/dartz.dart';
import 'package:trilling_web/features/order_feature/data/models/order_model.dart';
import 'package:trilling_web/features/order_feature/domain/repositories/order_repository.dart';

import '../../../../core/failures/store_failure.dart';

class GetOrdesForSpacificPeriodUseCase {
  final OrderRepository orderRepository;

  GetOrdesForSpacificPeriodUseCase({required this.orderRepository});

  Future<Either<Failure, List<OrderModel>>> call(
      {required DateTime startDays, required Duration duration}) async {
    return await orderRepository.getOrdersDuringPeriod(
        startDays: startDays, duration: duration);
  }
}
