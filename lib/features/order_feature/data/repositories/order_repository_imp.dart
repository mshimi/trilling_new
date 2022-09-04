import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trilling_web/core/extentions/firebasefirestore_extention.dart';
import 'package:trilling_web/core/utils/enums.dart';
import 'package:trilling_web/features/order_feature/data/models/order_model.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:trilling_web/features/order_feature/domain/repositories/order_repository.dart';

class OrderImp implements OrderRepository {
  final FirebaseFirestore firestore;
  const OrderImp({required this.firestore});

  @override
  Future<Either<Failure, OrderModel>> addNewOrder(
      {required String clientId, required OrderModel orderModel}) async {
    try {
      // Save orderModel to Orders Collection in Firebase
      DocumentReference<Map<String, dynamic>> documentReference =
          await firestore
              .appCollection(dbCollections: DbCollections.orders)
              .add(orderModel.toMap());

      // get DocumentId and save it as OrderId to Firebase

      String orderId = documentReference.id;
      OrderModel orderModelWithId = orderModel.copyWith(id: orderId);
      await firestore
          .appCollection(dbCollections: DbCollections.orders)
          .doc(orderId)
          .update(orderModelWithId.toMap());

      // save Order Inside the Clients Collection under OrderCollection

      await firestore
          .appCollection(
              dbCollections: DbCollections.clientOrders, clientId: clientId)
          .doc(orderId)
          .set(orderModelWithId.toMap());

      return Right(orderModelWithId);
    } catch (e) {
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getAllOrdersGreaterThanDay(
      {required DateTime dateTime}) async {
    try {
      int dateTimeFirebaseValue = dateTime.millisecondsSinceEpoch;

      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .appCollection(dbCollections: DbCollections.orders)
          .where('eventDate', isGreaterThanOrEqualTo: dateTimeFirebaseValue)
          .get();

      print(dateTimeFirebaseValue);
      var i = 1;
      List<OrderModel> orders = querySnapshot.docs.map((documentSnapshot) {
        print(documentSnapshot.data());
        print(i);
        i++;
        return OrderModel.fromMap(documentSnapshot.data());
      }).toList();

      print(orders.length);
      return Right(orders);
    } catch (e) {
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getCancelledOrders() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .appCollection(dbCollections: DbCollections.orders)
          .where('isCancelled', isEqualTo: true)
          .get();

      return Right(querySnapshot.docs
          .map(
              (documentSnapshot) => OrderModel.fromMap(documentSnapshot.data()))
          .toList());
    } catch (e) {
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getClientOrders(
      {required String clientId}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .appCollection(
              dbCollections: DbCollections.clientOrders, clientId: clientId)
          .get();

      return Right(querySnapshot.docs
          .map(
              (documentSnapshot) => OrderModel.fromMap(documentSnapshot.data()))
          .toList());
    } catch (e) {
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, OrderModel>> getOrderbyId(
      {required String orderId}) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await firestore
          .appCollection(dbCollections: DbCollections.orders)
          .doc(orderId)
          .get();

      return Right(OrderModel.fromMap(documentSnapshot.data()!));
    } catch (e) {
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getOrdersDuringPeriod(
      {required DateTime startDays, required Duration duration}) async {
    try {
      int startDate = startDays.millisecondsSinceEpoch;
      int endDate = startDays.add(duration).millisecondsSinceEpoch;

      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .appCollection(dbCollections: DbCollections.orders)
          .where('eventDate', isGreaterThanOrEqualTo: startDate)
          .where('eventDate', isLessThanOrEqualTo: endDate)
          .get();

      return Right(querySnapshot.docs
          .map(
              (documentSnapshot) => OrderModel.fromMap(documentSnapshot.data()))
          .toList());
    } catch (e) {
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getOrdersPerBookingDate(
      {required DateTime bookingsDate, required Duration duration}) async {
    try {
      int startDate = bookingsDate.millisecondsSinceEpoch;
      int endDate = bookingsDate.add(duration).millisecondsSinceEpoch;

      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .appCollection(dbCollections: DbCollections.orders)
          .where('bookingDate', isGreaterThanOrEqualTo: startDate)
          .where('bookingDate', isLessThanOrEqualTo: endDate)
          .get();
      return Right(querySnapshot.docs
          .map(
              (documentSnapshot) => OrderModel.fromMap(documentSnapshot.data()))
          .toList());
    } catch (e) {
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getReadyOrders() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .appCollection(dbCollections: DbCollections.orders)
          .where('isReady', isEqualTo: true)
          .get();

      return Right(querySnapshot.docs
          .map(
              (documentSnapshot) => OrderModel.fromMap(documentSnapshot.data()))
          .toList());
    } catch (e) {
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getUnPaidOrders() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .appCollection(dbCollections: DbCollections.orders)
          .where('isPaid', isEqualTo: false)
          .get();

      return Right(querySnapshot.docs
          .map(
              (documentSnapshot) => OrderModel.fromMap(documentSnapshot.data()))
          .toList());
    } catch (e) {
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getUndeliveredOrders() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .appCollection(dbCollections: DbCollections.orders)
          .where('isDelivared', isEqualTo: false)
          .get();

      return Right(querySnapshot.docs
          .map(
              (documentSnapshot) => OrderModel.fromMap(documentSnapshot.data()))
          .toList());
    } catch (e) {
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getUnCollectedOrders() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .appCollection(dbCollections: DbCollections.orders)
          .where('isDelivared', isEqualTo: true)
          .where('iscollected', isEqualTo: false)
          .get();

      return Right(querySnapshot.docs
          .map(
              (documentSnapshot) => OrderModel.fromMap(documentSnapshot.data()))
          .toList());
    } catch (e) {
      return Left(StoreFailure());
    }
  }

  @override
  Future<Either<Failure, OrderModel>> updateAnOrder(
      {required OrderModel orderModel}) async {
    try {
      // Update OrderModel in OrdersCollection

      await firestore
          .appCollection(dbCollections: DbCollections.orders)
          .doc(orderModel.id)
          .update(orderModel.toMap());

      // Update OrderModel in ClientsCollection

      await firestore
          .appCollection(
              dbCollections: DbCollections.clientOrders,
              clientId: orderModel.client.id)
          .doc(orderModel.id)
          .set(orderModel.toMap());

      return Right(orderModel);
    } catch (e) {
      return Left(StoreFailure());
    }
  }
}
