import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/core/utils/colors.dart';
import 'package:trilling_web/features/product_feature/presentation/bloc/products_bloc.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/products_page_widgts/searchoptions_checkbox.dart';

import '../../../../../core/presentation/widgets/app_elevatedbutton.dart';

class HeaderProductsPage extends StatefulWidget {
  const HeaderProductsPage({Key? key}) : super(key: key);

  @override
  State<HeaderProductsPage> createState() => _HeaderProductsPageState();
}

class _HeaderProductsPageState extends State<HeaderProductsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      buildWhen: (previous, current) =>
          previous.searchOption != current.searchOption,
      builder: (context, state) {
        ProductsBloc productsBloc = BlocProvider.of<ProductsBloc>(context);
        return Container(
            // height: context.getHeight() * 0.06,
            padding: EdgeInsets.only(right: 10, left: 10),
            decoration: BoxDecoration(
                border: Border.all(color: blueColor3),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Wrap(
                  children: SearchOptions.values.map((searchOptions) {
                    return SearchOptionCheckBox(
                      productState: state,
                      titel: searchOptions.name,
                      value: searchOptions == state.searchOption,
                      onChanged: (value) {
                        productsBloc.add(SearchOptionChangedEvent(
                            searchOptions: searchOptions));
                      },
                    );
                  }).toList(),
                )),
                AppElevatedButton(
                  width: context.getWidth() * 0.15,
                  text: 'Neues Product',
                  iconData: Icons.add,
                  onTap: () {
                    context.go('/Products/newProduct');
                  },
                )
              ],
            ));
      },
    );
  }
}
