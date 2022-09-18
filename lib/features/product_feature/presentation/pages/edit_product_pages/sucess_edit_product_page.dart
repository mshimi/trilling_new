// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/features/core_feature/domain/entities/core_data.dart';
import 'package:trilling_web/features/core_feature/domain/usecases/coredata_controller.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product.dart';
import 'package:trilling_web/features/product_feature/presentation/bloc/edit_product_bloc/edit_product_bloc_bloc.dart';
import 'package:trilling_web/features/product_feature/presentation/capicity_data_ui_controller.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/new_product_capicities.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/new_product_string_input.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../injection.dart';
import '../../widgets/category_and_subcategory_dropbutton.dart';
import '../../widgets/divider_widget.dart';
import '../../widgets/new_product_multichoice.dart';

class SucessEditProductPage extends StatefulWidget {
  final Product product;
  final CoreData coreData;
  late TextEditingController nameController;

  late TextEditingController descreptionController;

  late TextEditingController priceController;

  late TextEditingController minimumPaxController;
  SucessEditProductPage({
    Key? key,
    required this.product,
    required this.coreData,
  }) : super(key: key);

  @override
  State<SucessEditProductPage> createState() => _SucessEditProductPageState();
}

class _SucessEditProductPageState extends State<SucessEditProductPage> {
  @override
  Widget build(BuildContext context) {
    double height = context.getHeight();
    double width = context.getWidth();

    EditProductBlocBloc editProductBloc =
        BlocProvider.of<EditProductBlocBloc>(context);

    widget.nameController = TextEditingController(
      text: widget.product.name,
    );
    widget.priceController = TextEditingController(
      text: widget.product.pricePerPerson.toString(),
    );
    widget.descreptionController = TextEditingController(
      text: widget.product.descreption,
    );
    widget.minimumPaxController = TextEditingController(
      text: widget.product.minimumPax.toString(),
    );
    print(context.getWidth());
    print(context.getHeight());

    return Scaffold(
      appBar: AppBar(
        title: Text('Neues Product'),
        backgroundColor: blueColor1,
      ),
      body: Container(
        height: height,
        width: double.infinity,
        color: blueColor1,
        alignment: Alignment.topCenter,
        child: Container(
          height: height,
          color: Colors.white,
          padding: EdgeInsets.all(10),
          width: width * 0.75,
          child: ListView(
            shrinkWrap: true,
            controller: ScrollController(),
            children: [
              StringInputNewProduct(
                width: width,
                controller: widget.nameController,
                titel: 'Name',
              ),
              DividerWidget(),
              StringInputNewProduct(
                  width: width,
                  controller: widget.descreptionController,
                  titel: 'Beschreibung'),
              DividerWidget(),
              CategroyAndSubCategoryDropButton(
                categories: widget.coreData.categories,
                selectedCategory: widget.product.category,
                selectedsubCategory: widget.product.subCategory,
              ),
              DividerWidget(),
              StringInputNewProduct(
                  width: width,
                  controller: widget.priceController,
                  titel: 'Price pro Person'),
              DividerWidget(),
              StringInputNewProduct(
                  width: width,
                  controller: widget.minimumPaxController,
                  titel: 'Minimum Pax'),
              DividerWidget(),
              MultiChoiceItems(
                titel: 'Allergene',
                width: width,
                allItems: widget.coreData.allergene,
                selectedItems: widget.product.allergySubstances!,
              ),
              DividerWidget(),
              MultiChoiceItems(
                titel: 'Zusatzstoffe',
                width: width,
                allItems: widget.coreData.zusatzstoffe,
                selectedItems: widget.product.additives!,
              ),
              DividerWidget(),
              Container(
                height: height * 0.6,
                child: ProductCapicitiesInput(
                  titel: 'Kapizitäz',
                  packungen: widget.coreData.packungen,
                  capicityList: CapicityList.fromListOfProducts(
                      widget.product.productCapicites),
                ),
              ),
              /* this is only for test Button */

              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Product hinzufügen'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
