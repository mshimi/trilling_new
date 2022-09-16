import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/features/core_feature/domain/entities/product_category.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';
import 'package:trilling_web/features/product_feature/presentation/bloc/new_product_bloc/new_product_bloc.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/new_product_choice_input.dart';

import 'divider_widget.dart';

class CategroyAndSubCategoryDropButton extends StatefulWidget {
  List<ProductCategory> categories;
  String? selectedSubCategory;
  List<String> subCategories = [];

  CategroyAndSubCategoryDropButton(
      {super.key, this.selectedSubCategory, required this.categories});

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

    NewProductBloc newProductBloc = BlocProvider.of<NewProductBloc>(context);

    return Column(
      children: [
        ChoiceInpuNewProduct(
            onchanged: (v) {
              setState(() {
                newProductBloc.selectedCategory = v!;
                print(newProductBloc.selectedCategory);
              });
            },
            value: newProductBloc.selectedCategory,
            items: widget.categories.map((e) => e.name).toList(),
            height: height,
            width: width,
            titel: 'Kategorie'),
        DividerWidget(),
        ChoiceInpuNewProduct(
            onchanged: (v) {
              setState(() {
                newProductBloc.selectedsubCategory = v!;
                print(newProductBloc.selectedsubCategory);
              });
            },
            value: newProductBloc.selectedsubCategory,
            items: newProductBloc.subCatigories,
            height: height,
            width: width,
            titel: 'subKategorie'),
      ],
    );
  }
}
