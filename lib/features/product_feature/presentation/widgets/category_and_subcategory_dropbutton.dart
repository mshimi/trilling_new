import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/features/core_feature/domain/entities/product_category.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/new_product_choice_input.dart';

import 'divider_widget.dart';

class CategroyAndSubCategoryDropButton extends StatefulWidget {
  String selectedCategory;
  List<ProductCategory> categories;
  String? selectedSubCategory;
  List<String> subCategories = [];
  CategroyAndSubCategoryDropButton(
      {super.key,
      this.selectedSubCategory,
      required this.selectedCategory,
      required this.categories});

  @override
  State<CategroyAndSubCategoryDropButton> createState() =>
      _CategroyAndSubCategoryDropButtonState();
}

class _CategroyAndSubCategoryDropButtonState
    extends State<CategroyAndSubCategoryDropButton> {
  @override
  Widget build(BuildContext context) {
    double width = context.getWidth();
    double height = context.getWidth();

    for (var category in widget.categories) {
      if (category.name == widget.selectedCategory) {
        widget.subCategories = category.subCategories;
        widget.selectedSubCategory = widget.subCategories[0];
      }
    }

    print(widget.selectedSubCategory);

    return Flexible(
        child: Column(
      children: [
        ChoiceInpuNewProduct(
            onchanged: (v) {
              setState(
                () {
                  widget.selectedCategory = v!;
                  for (var category in widget.categories) {
                    if (category.name == widget.selectedCategory) {
                      widget.subCategories = category.subCategories;
                      widget.selectedSubCategory ??= widget.subCategories[0];
                    }
                  }
                },
              );
            },
            value: widget.selectedCategory,
            items: widget.categories.map((e) => e.name).toList(),
            height: height,
            width: width,
            titel: 'Kategorie'),
        DividerWidget(),
        ChoiceInpuNewProduct(
            onchanged: (v) {
              setState(() {
                widget.selectedSubCategory = v!;
              });
            },
            value: widget.selectedSubCategory!,
            items: widget.subCategories,
            height: height,
            width: width,
            titel: 'subKategorie'),
      ],
    ));
  }
}
