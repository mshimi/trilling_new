import 'package:flutter/foundation.dart';
import 'package:trilling_web/features/core_feature/domain/entities/core_data.dart';
import 'package:trilling_web/features/core_feature/domain/entities/product_category.dart';
import 'package:trilling_web/features/core_feature/domain/usecases/coredata_controller.dart';

class CategoryAndSubCategoryController {
  String category;
  String? subCategory;
  CoreData? coreData;

  // String? _uiCategory;

  // String? _uiSubCategory;

  CoreDataControllerUseCase coreDataControllerUseCase;

  CategoryAndSubCategoryController(
      {required this.category,
      this.subCategory,
      required this.coreDataControllerUseCase}) {
    init();
  }

  String get categoryValue {
    return category;
  }

  String get subCategoryValue {
    List<ProductCategory> categories = coreData!.categories;

    if (subCategory == null) {
      return categories
          .firstWhere((element) => element.name == category)
          .subCategories
          .first;
    } else if (!categories
        .firstWhere((element) => element.name == category)
        .subCategories
        .contains(subCategory)) {
      return categories
          .firstWhere((element) => element.name == category)
          .subCategories
          .first;
    } else {
      return subCategory!;
    }
  }

  List<String> get subCatigories {
    List<ProductCategory> categories = coreData!.categories;

    return categories
        .firstWhere((element) => element.name == category)
        .subCategories;
  }

  init() async {
    CoreData? coreData = await coreDataControllerUseCase.coreData;
    List<ProductCategory> categories = coreData!.categories;
  }
}
