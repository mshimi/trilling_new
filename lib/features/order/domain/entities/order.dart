import 'package:trilling_web/features/product/domain/entities/item.dart';

class Order {
  String id;
  DateTime orderDate;
  DateTime deliveryDate;
  List<Item> items;
  double totalPrice;
  int countGuest;
  Order({
    required this.id,
    required this.orderDate,
    required this.deliveryDate,
    required this.items,
    required this.totalPrice,
    required this.countGuest,
  });
}
