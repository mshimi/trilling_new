import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/features/product_feature/presentation/bloc/products_bloc.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/products_page_widgts/products_page_search_input_byName.dart';

class SearchInputProductPage extends StatelessWidget {
  const SearchInputProductPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      buildWhen:(previous, current) => previous.currentSearchOptions != current.currentSearchOptions ,
      builder: (context, state) {
        if(state.currentSearchOptions == SearchOptions.name){
          return SearchInputByProductName();
        } else {
          return SearchInputByProductName();
        }
      },
    );
  }
}
