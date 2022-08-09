import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:trilling_web/features/client_feature/data/models/adresse_model.dart';
import 'package:trilling_web/features/client_feature/data/models/client_model.dart';
import 'package:trilling_web/features/order_feature/data/models/collection_model.dart';
import 'package:trilling_web/features/order_feature/data/models/transfer_model.dart';
import 'package:trilling_web/features/order_feature/domain/entities/order.dart';
import 'package:trilling_web/features/product_feature/data/models/creation_info_model.dart';
import 'package:trilling_web/features/product_feature/data/models/product_model.dart';

class OrderModel extends Equatable {
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
  AdresseModel delivaryAdresse;
  ClientModel client;
  List<String>? additives;
  List<String>? allergySubstances;
  List<CollectionModel>? collections;
  List<ProductModel> products;
  CreationInfoModel creationInfo;
  TransferModel abholung;
  TransferModel bringen;
  bool collectionBooked;
  bool delivaryBooked;
  String? notes;
  OrderModel({
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
    required this.products,
    required this.creationInfo,
    required this.abholung,
    required this.bringen,
    required this.collectionBooked,
    required this.delivaryBooked,
    this.notes,
  });

  OrderModel copyWith({
    String? id,
    bool? isCancelled,
    bool? isReady,
    bool? isDelivared,
    bool? iscollected,
    bool? isPaid,
    int? totalItems,
    double? totalPrice,
    DateTime? bookingDate,
    DateTime? eventDate,
    AdresseModel? delivaryAdresse,
    ClientModel? client,
    List<String>? additives,
    List<String>? allergySubstances,
    List<CollectionModel>? collections,
    List<ProductModel>? products,
    CreationInfoModel? creationInfo,
    TransferModel? abholung,
    TransferModel? bringen,
    bool? collectionBooked,
    bool? delivaryBooked,
    String? notes,
  }) {
    return OrderModel(
      id: id ?? this.id,
      isCancelled: isCancelled ?? this.isCancelled,
      isReady: isReady ?? this.isReady,
      isDelivared: isDelivared ?? this.isDelivared,
      iscollected: iscollected ?? this.iscollected,
      isPaid: isPaid ?? this.isPaid,
      totalItems: totalItems ?? this.totalItems,
      totalPrice: totalPrice ?? this.totalPrice,
      bookingDate: bookingDate ?? this.bookingDate,
      eventDate: eventDate ?? this.eventDate,
      delivaryAdresse: delivaryAdresse ?? this.delivaryAdresse,
      client: client ?? this.client,
      additives: additives ?? this.additives,
      allergySubstances: allergySubstances ?? this.allergySubstances,
      collections: collections ?? this.collections,
      products: products ?? this.products,
      creationInfo: creationInfo ?? this.creationInfo,
      abholung: abholung ?? this.abholung,
      bringen: bringen ?? this.bringen,
      collectionBooked: collectionBooked ?? this.collectionBooked,
      delivaryBooked: delivaryBooked ?? this.delivaryBooked,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isCancelled': isCancelled,
      'isReady': isReady,
      'isDelivared': isDelivared,
      'iscollected': iscollected,
      'isPaid': isPaid,
      'totalItems': totalItems,
      'totalPrice': totalPrice,
      'bookingDate': bookingDate.millisecondsSinceEpoch,
      'eventDate': eventDate.millisecondsSinceEpoch,
      'delivaryAdresse': delivaryAdresse.toMap(),
      'client': client.toMap(),
      'additives': additives,
      'allergySubstances': allergySubstances,
      'collections': collections?.map((x) => x.toMap()).toList(),
      'products': products.map((x) => x.toMap()).toList(),
      'creationInfo': creationInfo.toMap(),
      'abholung': abholung.toMap(),
      'bringen': bringen.toMap(),
      'collectionBooked': collectionBooked,
      'delivaryBooked': delivaryBooked,
      'notes': notes,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      isCancelled: map['isCancelled'] ?? false,
      isReady: map['isReady'] ?? false,
      isDelivared: map['isDelivared'] ?? false,
      iscollected: map['iscollected'] ?? false,
      isPaid: map['isPaid'] ?? false,
      totalItems: map['totalItems']?.toInt() ?? 0,
      totalPrice: map['totalPrice']?.toDouble() ?? 0.0,
      bookingDate: DateTime.fromMillisecondsSinceEpoch(map['bookingDate']),
      eventDate: DateTime.fromMillisecondsSinceEpoch(map['eventDate']),
      delivaryAdresse: AdresseModel.fromMap(map['delivaryAdresse']),
      client: ClientModel.fromMap(map['client']),
      additives: List<String>.from(map['additives']),
      allergySubstances: List<String>.from(map['allergySubstances']),
      collections: map['collections'] != null
          ? List<CollectionModel>.from(
              map['collections']?.map((x) => CollectionModel.fromMap(x)))
          : null,
      products: List<ProductModel>.from(
          map['products']?.map((x) => ProductModel.fromMap(x))),
      creationInfo: CreationInfoModel.fromMap(map['creationInfo']),
      abholung: TransferModel.fromMap(map['abholung']),
      bringen: TransferModel.fromMap(map['bringen']),
      collectionBooked: map['collectionBooked'] ?? false,
      delivaryBooked: map['delivaryBooked'] ?? false,
      notes: map['notes'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(id: $id, isCancelled: $isCancelled, isReady: $isReady, isDelivared: $isDelivared, iscollected: $iscollected, isPaid: $isPaid, totalItems: $totalItems, totalPrice: $totalPrice, bookingDate: $bookingDate, eventDate: $eventDate, delivaryAdresse: $delivaryAdresse, client: $client, additives: $additives, allergySubstances: $allergySubstances, collections: $collections, products: $products, creationInfo: $creationInfo, abholung: $abholung, bringen: $bringen, collectionBooked: $collectionBooked, delivaryBooked: $delivaryBooked, notes: $notes)';
  }

  @override
  List<Object> get props {
    return [
      id!,
      isCancelled,
      isReady,
      isDelivared,
      iscollected,
      isPaid,
      totalItems,
      totalPrice,
      bookingDate,
      eventDate,
      delivaryAdresse,
      client,
      additives!,
      allergySubstances!,
      collections!,
      products,
      creationInfo,
      abholung,
      bringen,
      collectionBooked,
      delivaryBooked,
      notes!,
    ];
  }

  factory OrderModel.fromDomain(Order order) {
    return OrderModel(
        isCancelled: order.isCancelled,
        isReady: order.isReady,
        isDelivared: order.isDelivared,
        iscollected: order.iscollected,
        isPaid: order.isPaid,
        totalItems: order.totalItems,
        totalPrice: order.totalPrice,
        bookingDate: order.bookingDate,
        eventDate: order.eventDate,
        delivaryAdresse: AdresseModel.fromDomain(order.delivaryAdresse),
        client: ClientModel.fromDomain(order.client),
        products:
            order.products.map((e) => ProductModel.fromDomain(e)).toList(),
        creationInfo: CreationInfoModel.fromDomain(order.creationInfo),
        abholung: TransferModel.fromDomain(order.abholung),
        bringen: TransferModel.fromDomain(order.bringen),
        collectionBooked: order.collectionBooked,
        delivaryBooked: order.delivaryBooked,
        id: order.id!,
        additives: order.additives,
        allergySubstances: order.allergySubstances,
        collections: order.collections!
            .map((e) => CollectionModel.fromDomain(e))
            .toList(),
        notes: order.notes);
  }

  Order toDomain() {
    return Order(
      isCancelled: isCancelled,
      isReady: isReady,
      isDelivared: isDelivared,
      iscollected: iscollected,
      isPaid: isPaid,
      totalItems: totalItems,
      totalPrice: totalPrice,
      bookingDate: bookingDate,
      eventDate: eventDate,
      delivaryAdresse: delivaryAdresse.toDomain(),
      client: client.toDomain(),
      creationInfo: creationInfo.toDomain(),
      abholung: abholung.toDomain(),
      bringen: bringen.toDomain(),
      collectionBooked: collectionBooked,
      delivaryBooked: delivaryBooked,
      products: products.map((e) => e.toDomain()).toList(),
    );
  }
}
