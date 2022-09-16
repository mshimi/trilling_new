import 'package:flutter/material.dart';
import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';
import 'package:trilling_web/features/product_feature/domain/entities/creationinfo.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product_capicity.dart';
import 'package:trilling_web/features/product_feature/domain/usecases/add_new_product.dart';
import 'package:trilling_web/features/product_feature/presentation/bloc/new_product_bloc/new_product_bloc.dart';
import 'package:trilling_web/features/product_feature/presentation/capicity_data_ui_controller.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/category_and_subcategory_dropbutton.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/divider_widget.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/new_product_string_input.dart';

import '../../../../injection.dart';
import '../widgets/new_product_capicities.dart';
import '../widgets/new_product_multichoice.dart';

class NewProductPage extends StatelessWidget {
  NewProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = context.getWidth();
    double height = context.getHeight();
    List<String> selectedAllergene = [];
    List<String> selectedZusatzStoff = [];
    List<ProductCapicity> productCapicites = [];
    final CapicityList capicityList = CapicityList();

    CoreBloc coreBloc = BlocProvider.of<CoreBloc>(context);
    List<String> categories =
        coreBloc.coreData.categories.map((e) => e.name).toList();

    List<String> allergene = coreBloc.coreData.allergene;
    List<String> zusatzstoffe = coreBloc.coreData.zusatzstoffe;

    //Controllers
    TextEditingController nameController = TextEditingController();
    TextEditingController descreptionController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController minimumPaxController = TextEditingController();

    return BlocProvider(
      create: (context) => NewProductBloc(
          addNewProductUseCase: sl.get<AddNewProductUseCase>(),
          coreBloc: BlocProvider.of<CoreBloc>(context)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Neues Product'),
          backgroundColor: blueColor1,
        ),
        body: BlocConsumer<NewProductBloc, NewProductState>(
          listener: (context, state) {
            if (state is SuccesAddNewProduct) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return Container(
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
                      controller: nameController,
                      titel: 'Name',
                    ),
                    DividerWidget(),
                    StringInputNewProduct(
                        width: width,
                        controller: descreptionController,
                        titel: 'Beschreibung'),
                    DividerWidget(),
                    CategroyAndSubCategoryDropButton(
                        categories: coreBloc.categories),
                    DividerWidget(),
                    StringInputNewProduct(
                        width: width,
                        controller: priceController,
                        titel: 'Price pro Person'),
                    DividerWidget(),
                    StringInputNewProduct(
                        width: width,
                        controller: minimumPaxController,
                        titel: 'Minimum Pax'),
                    DividerWidget(),
                    MultiChoiceItems(
                      titel: 'Allergene',
                      width: width,
                      allItems: allergene,
                      selectedItems: selectedAllergene,
                    ),
                    DividerWidget(),
                    MultiChoiceItems(
                      titel: 'Zusatzstoffe',
                      width: width,
                      allItems: zusatzstoffe,
                      selectedItems: selectedZusatzStoff,
                    ),
                    DividerWidget(),
                    Container(
                      height: height * 0.6,
                      child: ProductCapicitiesInput(
                        titel: 'Kapizitäz',
                        packungen: coreBloc.coreData.packungen,
                        capicityList: capicityList,
                      ),
                    ),
                    /* this is only for test Button */

                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<NewProductBloc>(context).add(
                                  AddNewProductEvent(
                                      additives: selectedZusatzStoff,
                                      allergySubstances: selectedAllergene,
                                      descreption: descreptionController.text,
                                      name: nameController.text,
                                      minimumPax:
                                          int.parse(minimumPaxController.text),
                                      pricePerPerson:
                                          double.parse(priceController.text),
                                      productCapicites:
                                          capicityList.capicities));
                            },
                            child: const Text('Product hinzufügen'))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
