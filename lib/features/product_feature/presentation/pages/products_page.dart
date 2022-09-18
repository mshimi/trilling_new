import 'package:flutter/material.dart';

import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/product_feature/presentation/bloc/products_bloc.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/products_page_widgts/products_page_header_searchoptions.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/products_page_widgts/searchoptions_checkbox.dart';

import '../widgets/products_page_widgts/products_page_Search_input.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = context.getHeight();
    double width = context.getWidth();

    // List<String> searchOptions = [
    //   'Name',
    //   'Id',
    //   'price',
    //   'Kategorie',
    //   'Min. Pax',
    //   'Allergene',
    //   'zusatzstoffe'
    // ];

    return BlocConsumer<ProductsBloc, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var currentSearchOption = state.searchOption;
        return Container(
            padding: EdgeInsets.all(10),
            height: height,
            child: ListView(
              children: [
                HeaderProductsPage(),
                  Divider(),
                SearchInputProductPage(),

              ],
            ));
      },
    );
  }
}
