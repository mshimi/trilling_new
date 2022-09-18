import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/features/core_feature/domain/entities/core_data.dart';
import 'package:trilling_web/features/core_feature/domain/entities/product_category.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';
import 'package:trilling_web/features/product_feature/presentation/bloc/new_product_bloc/new_product_bloc.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/new_product_choice_input.dart';

import 'divider_widget.dart';

class CategroyAndSubCategoryDropButton extends StatefulWidget {
  List<ProductCategory> categories;
  String? selectedSubCategory;
  List<String> subCategories = [];
  String selectedCategory;
  String selectedsubCategory;
  

  CategroyAndSubCategoryDropButton(
      {super.key,
      this.selectedSubCategory,

      required this.categories,
      required this.selectedCategory,
      required this.selectedsubCategory});

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

    // NewProductBloc newProductBloc = BlocProvider.of<NewProductBloc>(context);
    List<String> subCatigories = widget.categories
        .firstWhere((element) => element.name == widget.selectedCategory)
        .subCategories;
    return Column(
      children: [
        ChoiceInpuNewProduct(
            onchanged: (v) {
              setState(() {
                widget.selectedCategory = v!;
              });
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
                widget.selectedsubCategory = v!;
                print(widget.selectedsubCategory);
              });
            },
            value: widget.selectedsubCategory,
            items: widget.subCategories,
            height: height,
            width: width,
            titel: 'subKategorie'),
      ],
    );
  }
}
