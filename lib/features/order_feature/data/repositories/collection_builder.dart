import 'package:dartz/dartz_unsafe.dart';
import 'package:trilling_web/features/order_feature/domain/entities/collection.dart';
import 'package:trilling_web/features/order_feature/domain/entities/order_item.dart';
import 'package:trilling_web/features/order_feature/domain/repositories/collection_builder.dart';
import 'package:trilling_web/features/product_feature/data/models/packung_model.dart';
import 'package:trilling_web/features/product_feature/data/models/product_capicity_model.dart';
import 'package:trilling_web/features/product_feature/domain/entities/creationinfo.dart';
import 'package:trilling_web/features/product_feature/domain/entities/packung.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product_capicity.dart';

class OrderCollectionBuilderImp implements OrderCollectionBuilderRepository {
  @override
  List<OrderItem> buildCollection(
      {required List<Product> productList, required int paxNumber}) {
    List<OrderItem> collectionOfOneProduct = [];
    for (var element in productList) {
      collectionOfOneProduct.addAll(getCountPackungPerProduct(paxNumber: paxNumber, product: element));
      
    }

    return collectionOfOneProduct;
  }

  @override
  List<OrderItem> getCountPackungPerProduct(
      {required int paxNumber, required Product product}) {
    List<ProductCapicity> productCapicites = product.productCapicites;

    productCapicites.sort((a, b) => a.maxPax.compareTo(b.maxPax));
    List<OrderItem> collectionOfOneProduct = [];

    for (var i = 2; i >= 0; i--) {
      Packung packung = productCapicites[i].packung;
      while (paxNumber >=
              ProductCapicityModel.fromDomain(productCapicites[i]).maxPax ||
          paxNumber >=
              ProductCapicityModel.fromDomain(productCapicites[i]).minPax) {
        OrderItem orderItem = OrderItem(
            packung: packung.name,
            paxNumber: productCapicites[i].maxPax,
            value: packung.value,
            product: product);
        collectionOfOneProduct.add(orderItem);
        print(
            '$paxNumber - ${ProductCapicityModel.fromDomain(productCapicites[i]).maxPax}');
        paxNumber = paxNumber -
            ProductCapicityModel.fromDomain(productCapicites[i]).maxPax;
      }
      // if (i == productCapicites.length - 1 &&
      //     paxNumber <
      //         ProductCapicityModel.fromDomain(productCapicites[i]).minPax) {
      //   print('the Rest  $paxNumber');
      //   int lastItem = collectionOfOneProduct.length - 1;
      //   collectionOfOneProduct[lastItem] = OrderItem(
      //       packung: productCapicites[i].packung.name,
      //       paxNumber: productCapicites[i].minPax,
      //       value: productCapicites[i].packung.value);

      //   //   collectionOfOneProduct.add(OrderItem(
      //   //       packung: productCapicites[i].packung.name,
      //   //       paxNumber: paxNumber,
      //   //       value: productCapicites[i].packung.value));
      // }
    }
    for (var element in collectionOfOneProduct) {
      print('${element.packung}, ${element.value},${element.paxNumber},');
    }
    return collectionOfOneProduct;
  }
}
