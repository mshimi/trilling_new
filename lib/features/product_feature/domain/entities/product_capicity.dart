import 'package:trilling_web/features/product_feature/domain/entities/packung.dart';

class ProductCapicity {
  int maxPax;
  int minPax;
  Packung packung;
  ProductCapicity({
    required this.minPax,
    required this.maxPax,
    required this.packung,
  });
}
