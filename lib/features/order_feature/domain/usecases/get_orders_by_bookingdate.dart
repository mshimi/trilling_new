import 'package:dartz/dartz.dart';
import 'package:trilling_web/features/order_feature/data/models/order_model.dart';
import 'package:trilling_web/features/order_feature/domain/repositories/order_repository.dart';

import '../../../../core/failures/store_failure.dart';

class GetOrdesByBookingDateUseCase {
  final OrderRepository orderRepository;

  GetOrdesByBookingDateUseCase({required this.orderRepository});

  Future<Either<Failure, List<OrderModel>>> call(
      {required DateTime bookingsDate, required Duration duration}) async {
    return await orderRepository.getOrdersPerBookingDate(
        bookingsDate: bookingsDate, duration: duration);
  }
}
