import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/product_feature/domain/entities/packung.dart';

class ProductCapicity extends Equatable {
  int maxPax;
  int minPax;
  Packung packung;
  ProductCapicity({
    required this.minPax,
    required this.maxPax,
    required this.packung,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [maxPax, minPax, packung];
}
