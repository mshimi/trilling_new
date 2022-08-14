import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/core/utils/enums.dart';

extension FireBaseFireStoreCollection on FirebaseFirestore {
  CollectionReference<Map<String, dynamic>> appCollection(
      {required DbCollections dbCollections, String? clientId}) {
    switch (dbCollections) {
      case DbCollections.client:
        return collection('clients');

      case DbCollections.clientOrders:
        return collection('clients').doc(clientId).collection('orders');

      case DbCollections.orders:
        return collection('orders');

          case DbCollections.products:
        return collection('products');
         case DbCollections.core:
        return collection('core');

      default:
        throw (Exception);
    }
  }


}
