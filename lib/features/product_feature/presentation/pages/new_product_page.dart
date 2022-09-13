import 'package:flutter/material.dart';
import 'package:trilling_web/features/auth/domain/repositries/auth_repo.dart';
import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';
import 'package:trilling_web/features/product_feature/domain/entities/creationinfo.dart';
import 'package:trilling_web/features/product_feature/domain/entities/packung.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product_capicity.dart';
import 'package:trilling_web/features/product_feature/presentation/bloc/new_product_bloc/new_product_bloc.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/category_and_subcategory_dropbutton.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/divider_widget.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/new_product_string_input.dart';

import '../../../../injection.dart';
import '../widgets/new_product_capicities.dart';
import '../widgets/new_product_multichoice.dart';

class NewProductPage extends StatelessWidget {
  const NewProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = context.getWidth();
    double height = context.getHeight();
    List<String> selectedAllergene = [];
    List<String> selectedZusatzStoff = [];
    List<ProductCapicity> productCapicites = [];
    CoreBloc coreBloc = BlocProvider.of<CoreBloc>(context);
    List<String> categories =
        coreBloc.coreData.categories.map((e) => e.name).toList();

    String selectedCategory = categories[0];
    String? selectedSubCategory;
    List<String> subCategories = [];
    for (var category in coreBloc.categories) {
      if (category.name == selectedCategory) {
        subCategories = category.subCategories;
        selectedSubCategory = subCategories[0];
      }
    }

    List<String> allergene = coreBloc.coreData.allergene;
    List<String> zusatzstoffe = coreBloc.coreData.zusatzstoffe;

    Product product = Product(
        allergySubstances: [],
        additives: [],
        name: 'Name',
        descreption: 'descreption',
        minimumPax: 10,
        pricePerPerson: 10,
        category: 'category',
        subCategory: 'subCategory',
        creationInfo: CreationInfo(
            creationDate: DateTime.now(),
            userName: 'Mahmoud',
            userId: 'userId'),
        productCapicites: <ProductCapicity>[
          ProductCapicity(
              minPax: 10, maxPax: 20, packung: Packung(name: '', value: 1))
        ]);

    //Controllers
    TextEditingController nameController = TextEditingController();
    TextEditingController descreptionController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController minimumPaxController = TextEditingController();

    return BlocProvider(
      create: (context) => sl.get<NewProductBloc>(),
      child: Scaffold(
        body: BlocConsumer<NewProductBloc, NewProductState>(
          listener: (context, state) {
            // TODO: implement listener
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
                        selectedSubCategory: selectedSubCategory!,
                        selectedCategory: selectedCategory,
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
                    DividerWidget(
                      height: 15,
                    ),
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
                        productCapicites: productCapicites,
                      ),
                    ),
                    /* this is only for test Button */

                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Product product = Product(
                                  pricePerPerson: 10,
                                  category: 'category',
                                  subCategory: 'subCategory',
                                  name: nameController.text,
                                  descreption: descreptionController.text,
                                  minimumPax: 10,
                                  creationInfo: CreationInfo(
                                      userName: sl
                                          .get<Auth_Repo>()
                                          .currentAppUser()!
                                          .email,
                                      userId: sl
                                          .get<Auth_Repo>()
                                          .currentAppUser()!
                                          .id,
                                      creationDate: DateTime.now()),
                                  productCapicites: []);
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
