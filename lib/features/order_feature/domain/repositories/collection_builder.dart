
import 'package:trilling_web/features/order_feature/domain/entities/order_item.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product.dart';

abstract class OrderCollectionBuilderRepository {
  List<OrderItem> buildCollection({required List<Product> productList, required int paxNumber});

 List<OrderItem>  getCountPackungPerProduct({required int paxNumber, required Product product});
}
