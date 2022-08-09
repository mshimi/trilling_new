import 'package:trilling_web/features/product_feature/domain/entities/product.dart';

class Collection {
  List<Product> listOfProduct;
  String packungType;
  Collection({
    required this.listOfProduct,
    required this.packungType,
  });
  
}
