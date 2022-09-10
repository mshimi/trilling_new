import 'package:trilling_web/features/core_feature/domain/entities/city.dart';
import 'package:trilling_web/features/core_feature/domain/entities/product_category.dart';
import 'package:trilling_web/features/product_feature/domain/entities/packung.dart';

class CoreData {
  List<City> cities;
  List<ProductCategory> categories;
  List<Packung> packungen;
  List<String> zusatzstoffe;
  List<String> allergene;

  CoreData(
      {required this.categories,
      required this.cities,
      required this.packungen,
      required this.allergene,
      required this.zusatzstoffe});
}
