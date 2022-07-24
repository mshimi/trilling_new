import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trilling_web/features/product/domain/entities/item.dart';
import 'package:trilling_web/features/product/inftastructure/model/itemModel.dart';
import 'package:trilling_web/features/order/domain/entities/order.dart';

class OrderModel {
  String id;
  String orderDate;
  String deliveryDate;
  List<ItemModel> items;
  double totalPrice;
  int countGuest;
  bool isCancelled;
  OrderModel({
    required this.id,
    required this.orderDate,
    required this.deliveryDate,
    required this.items,
    required this.totalPrice,
    required this.countGuest,
    required this.isCancelled,
  });

  factory OrderModel.fromDomain(Order order) {
    List<ItemModel> itemModelList = [];
    order.items.forEach(
      (item) {
        itemModelList.add(ItemModel.fromDomain(item));
      },
    );
    return OrderModel(
        id: order.id,
        orderDate: order.orderDate.toString(),
        deliveryDate: order.deliveryDate.toString(),
        items: itemModelList,
        totalPrice: order.totalPrice,
        countGuest: order.countGuest,
        isCancelled: order.isCancelled);
  }

  Order toDomain() {
    List<Item> itemList = [];
    items.forEach((item) {
      itemList.add(item.toDomain());
    });

    return Order(
        id: id,
        orderDate: DateTime.parse(orderDate),
        deliveryDate: DateTime.parse(deliveryDate),
        items: itemList,
        totalPrice: totalPrice,
        countGuest: countGuest);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'orderDate': orderDate,
      'deliveryDate': deliveryDate,
      'items': items,
      'totalPrice': totalPrice,
      'countGuest': countGuest,
    };
  }

  factory OrderModel.fromMap(Map map) {
    return OrderModel(
        id: map['id'],
        orderDate: map['orderDate'],
        deliveryDate: map['deliveryDate'],
        items: map['items'],
        totalPrice: map['totalPrice'],
        countGuest: map['countGuest'],
        isCancelled: map['isCancelled']);
  }

  factory OrderModel.fromFirebase(
      DocumentSnapshot<Map<String, dynamic>> userData) {
    return OrderModel.fromMap(userData.data()!);
  }
}
