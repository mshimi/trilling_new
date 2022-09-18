import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/features/core_feature/domain/usecases/coredata_controller.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product.dart';
import 'package:trilling_web/features/product_feature/domain/usecases/get_product_by_id_usecase.dart';
import 'package:trilling_web/features/product_feature/domain/usecases/product_usecase.dart';
import 'package:trilling_web/features/product_feature/presentation/bloc/edit_product_bloc/edit_product_bloc_bloc.dart';
import 'package:trilling_web/features/product_feature/presentation/pages/edit_product_pages/Error_page.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/category_and_subcategory_dropbutton.dart';
import 'package:trilling_web/features/product_feature/presentation/widgets/new_product_string_input.dart';
import 'package:trilling_web/injection.dart';

import '../../../../core/utils/colors.dart';
import '../widgets/divider_widget.dart';
import '../widgets/new_product_capicities.dart';
import '../widgets/new_product_multichoice.dart';
import 'edit_product_pages/sucess_edit_product_page.dart';
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
          productId: productId,
          productControllerUseCase: sl.get<ProductControllerUseCase>(),
          coreDataControllerUseCase: sl.get<CoreDataControllerUseCase>())
        ..add(InitEvent()),
      child: BlocConsumer<EditProductBlocBloc, EditProductBlocState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is EditProductBlocInitial) {
            return LoadingPage();
          } else if (state is ErrorGettingProductState) {
            return ErrorPage();
          } else if (state is SucsessGettingProductState) {
            print(state.coreData.allergene);
            return SucessEditProductPage(
              product: state.product,
              coreData: state.coreData,
            );
          } else {
            return ErrorPage();
          }
        },
      ),
    );
  }
}
