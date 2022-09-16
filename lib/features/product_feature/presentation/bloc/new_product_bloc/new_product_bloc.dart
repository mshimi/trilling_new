import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';
import 'package:trilling_web/features/product_feature/data/models/product_model.dart';
import 'package:trilling_web/features/product_feature/domain/entities/creationinfo.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product_capicity.dart';
import 'package:trilling_web/injection.dart';

import '../../../../../core/failures/store_failure.dart';
import '../../../domain/usecases/add_new_product.dart';

part 'new_product_event.dart';
part 'new_product_state.dart';

class NewProductBloc extends Bloc<NewProductEvent, NewProductState> {
  final AddNewProductUseCase addNewProductUseCase;
  final CoreBloc coreBloc;

  NewProductBloc({required this.addNewProductUseCase, required this.coreBloc})
      : super(NewProductInitialState()) {
    on<AddNewProductEvent>((event, emit) async {
      Product product = Product(
        additives: event.additives,
        allergySubstances: event.allergySubstances,
          pricePerPerson: event.pricePerPerson,
          category: selectedCategory,
          subCategory: selectedsubCategory,
          name: event.name,
          descreption: event.descreption,
          minimumPax: event.minimumPax,
          creationInfo: CreationInfo(
              creationDate: DateTime.now(), userId: 'mah', userName: 'mah'),
          productCapicites: event.productCapicites);
      Either<Failure, Unit> failureOrDone = await addNewProductUseCase.call(
          productModel: ProductModel.fromDomain(product));

      failureOrDone.fold((l) => null, (r) {
        emit(SuccesAddNewProduct(product: product));
      });
    });
  }

  String? _selectedCategory;
  String? _selectedsubCategory;
  List<String>? _subCatigories;

  List<String> get subCatigories {
    _subCatigories = coreBloc.categories
        .firstWhere((element) => element.name == _selectedCategory)
        .subCategories;

    return _subCatigories!;
  }

  String get selectedCategory {
    if (_selectedCategory == null) {
      _selectedCategory = coreBloc.categories[0].name;
      return _selectedCategory!;
    } else {
      return _selectedCategory!;
    }
  }

  set selectedCategory(String value) {
    _selectedCategory = value;
    selectedsubCategory;
  }

  String get selectedsubCategory {
    if (_selectedsubCategory == null) {
      return coreBloc.categories
          .firstWhere((element) => element.name == selectedCategory)
          .subCategories[0];
    } else if (!coreBloc.categories
        .firstWhere((element) => element.name == _selectedCategory)
        .subCategories
        .contains(_selectedsubCategory)) {
      return coreBloc.categories
          .firstWhere((element) => element.name == selectedCategory)
          .subCategories[0];
    } else {
      return _selectedsubCategory!;
    }
  }

  set selectedsubCategory(String? value) {
    _selectedsubCategory = value;
  }
}
