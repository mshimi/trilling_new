import 'package:trilling_web/features/product_feature/domain/entities/product.dart';

class OrderItem {
  String packung;
  int paxNumber;
  double value;
  Product product;

  OrderItem(
      {required this.packung, required this.paxNumber, required this.value, required this.product});
}
