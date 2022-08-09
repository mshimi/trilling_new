import 'package:dartz/dartz.dart';
import 'package:trilling_web/features/product_feature/domain/entities/packung.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product_capicity.dart';

class OrderItem {
  String packung;
  int paxNumber;
  double value;
  Product product;

  OrderItem(
      {required this.packung, required this.paxNumber, required this.value, required this.product});
}
