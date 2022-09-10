import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/core/utils/colors.dart';
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
import 'package:trilling_web/features/product_feature/presentation/widgets/new_product_choice_input.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/new_product_string_input.dart';

import '../../../../injection.dart';

class NewProductPage extends StatelessWidget {
  const NewProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = context.getWidth();
    double height = context.getHeight();

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

    Product product = Product(
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

    print('this is selectedCategory  $selectedCategory');

    return BlocProvider(
      create: (context) => sl.get<NewProductBloc>(),
      child: Scaffold(
        body: BlocConsumer<NewProductBloc, NewProductState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Container(
              color: blueColor1,
              child: Center(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  width: width * 0.75,
                  child: Column(
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
                     
                      CategroyAndSubCategoryDropButton(selectedSubCategory: selectedSubCategory!, selectedCategory: selectedCategory, categories: coreBloc.categories),
                      const Expanded(child: Placeholder()),
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
                              child: Text('Product hinzufügen'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
