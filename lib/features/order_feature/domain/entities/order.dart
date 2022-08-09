import 'package:trilling_web/features/client_feature/domain/entities/adresse.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';
import 'package:trilling_web/features/order_feature/domain/entities/collection.dart';
import 'package:trilling_web/features/order_feature/domain/entities/transfer.dart';
import 'package:trilling_web/features/product_feature/domain/entities/creationinfo.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product.dart';

class Order {
  String? id;
  bool isCancelled;
  bool isReady;
  bool isDelivared;
  bool iscollected;
  bool isPaid;
  int totalItems;
  double totalPrice;
  DateTime bookingDate;
  DateTime eventDate;
  Adresse delivaryAdresse;
  Client client;
  List<String>? additives;
  List<String>? allergySubstances;
  List<Collection>? collections;
  List<Product> products;
  CreationInfo creationInfo;
  Transfer abholung;
  Transfer bringen;
  bool collectionBooked;
  bool delivaryBooked;
  String? notes;
  Order({
    this.id,
    required this.isCancelled,
    required this.isReady,
    required this.isDelivared,
    required this.iscollected,
    required this.isPaid,
    required this.totalItems,
    required this.totalPrice,
    required this.bookingDate,
    required this.eventDate,
    required this.delivaryAdresse,
    required this.client,
    this.additives,
    this.allergySubstances,
    this.collections,
    required this.creationInfo,
    required this.abholung,
    required this.bringen,
    required this.collectionBooked,
    required this.delivaryBooked,
    this.notes,
    required this.products
  });
}
