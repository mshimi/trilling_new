import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product.dart';
import 'package:trilling_web/features/product_feature/domain/usecases/get_product_by_id_usecase.dart';
import 'package:trilling_web/features/product_feature/presentation/bloc/edit_product_bloc/edit_product_bloc_bloc.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/category_and_subcategory_dropbutton.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/new_product_string_input.dart';
import 'package:trilling_web/injection.dart';

import '../../../../core/utils/colors.dart';
import '../widgets/divider_widget.dart';
import '../widgets/new_product_capicities.dart';
import '../widgets/new_product_multichoice.dart';
import 'loading_page.dart';

class EditProductPage extends StatelessWidget {
  final Product? product;
  final String productId;
  const EditProductPage({super.key, this.product, required this.productId});

  @override
  Widget build(BuildContext context) {
    double height = context.getHeight();
    double width = context.getHeight();

    return BlocProvider(
      create: (context) => EditProductBlocBloc(
          internalProduct: product,
          getProductByIdUseCase: sl.get<GetProductByIdUseCase>(),
          productId: productId),
      child: BlocConsumer<EditProductBlocBloc, EditProductBlocState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is EditProductBlocInitial) {
            return LoadingPage();
          }

          EditProductBlocBloc editProductBloc = BlocProvider.of<EditProductBlocBloc>(context);
          CoreBloc coreBloc = BlocProvider.of<CoreBloc>(context);

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
                      controller: editProductBloc.nameController,
                      titel: 'Name',
                    ),
                    DividerWidget(),
                    StringInputNewProduct(
                        width: width,
                        controller: editProductBloc.descreptionController,
                        titel: 'Beschreibung'),
                    DividerWidget(),
                    CategroyAndSubCategoryDropButton(
                        categories: coreBloc.categories),
                    DividerWidget(),
                    StringInputNewProduct(
                        width: width,
                        controller: editProductBloc. priceController,
                        titel: 'Price pro Person'),
                    DividerWidget(),
                    StringInputNewProduct(
                        width: width,
                        controller:editProductBloc. minimumPaxController,
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
                            onPressed: () {},
                            child: const Text('Product hinzufügen'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
