import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:trilling_web/features/core_feature/data/models/core_data_model.dart';
import 'package:trilling_web/core/failures/store_failure.dart';
import 'package:trilling_web/features/core_feature/data/repositories/city_table_builder.dart';
import 'package:trilling_web/features/core_feature/domain/entities/city.dart';
import 'package:trilling_web/features/core_feature/domain/entities/core_data.dart';
import 'package:trilling_web/features/core_feature/domain/entities/district.dart';
import 'package:trilling_web/features/core_feature/domain/entities/product_category.dart';
import 'package:trilling_web/features/core_feature/domain/usecases/get_core_data_usecase.dart';
import 'package:trilling_web/features/core_feature/domain/usecases/update_core_data_usecase.dart';
import 'package:trilling_web/features/product_feature/domain/entities/packung.dart';

part 'core_event.dart';
part 'core_state.dart';

class CoreBloc extends Bloc<CoreEvent, CoreState> {
  final GetCoreDataUseCase getCoreDataUseCase;
  final UpdateCoreDataUseCase updateCoreDataUseCase;

  CoreBloc(
      {required this.getCoreDataUseCase, required this.updateCoreDataUseCase})
      : super(CoreInitial()) {
    on<GetCoreDataEvent>((event, emit) async {
      Either<Failure, CoreDataModel> eitherFailureOrCoreDataModel =
          await getCoreDataUseCase.call();
      eitherFailureOrCoreDataModel.fold(
        (l) {},
        (coredata) {
          coreData = coredata.toDomain();
          packungen = coreData.packungen;
          categories = coreData.categories;
          cities = coreData.cities;
        },
      );
      districtsDataRow = CityTableBuilder(
              districts: coreData.cities[selectedCityIndex].districts)
          .buildDataRow();
    });

    on<CityIndexChanged>((event, emit) {
      selectedCityIndex = event.index;

      districtsDataRow = CityTableBuilder(
              districts: coreData.cities[selectedCityIndex].districts)
          .buildDataRow();
      emit(CityIndexChangedState(index: event.index));
    });

    on<DistrictDeletedEvent>((event, emit) async {
      if (coreData.cities[selectedCityIndex].districts[event.districtIndex] !=
          newDistrict) {
        coreData.cities[selectedCityIndex].districts
            .removeAt(event.districtIndex);
        Either<Failure, Unit> eitherFailureOrUnit = await updateCoreDataUseCase
            .call(coreDataModel: CoreDataModel.fromDomain(coreData));

        if (eitherFailureOrUnit.isLeft()) {
          //TODO: in case of Failure

        }
      } else {
        coreData.cities[selectedCityIndex].districts
            .removeAt(event.districtIndex);
      }

      emit(DistrictUpdatedState(districtIndex: event.districtIndex));
    });

    on<DistrictChangedEvent>((event, emit) async {
      coreData.cities[selectedCityIndex].districts[event.districtIndex]
          .transferPrice = event.transferPrice;

      Either<Failure, Unit> eitherFailureOrUnit = await updateCoreDataUseCase
          .call(coreDataModel: CoreDataModel.fromDomain(coreData));

      if (eitherFailureOrUnit.isLeft()) {
        //TODO: in case of Failure

      }
    });

    on<AddNewDistrictEvent>((event, emit) {
      if (!coreData.cities[selectedCityIndex].districts.contains(newDistrict)) {
        coreData.cities[selectedCityIndex].districts.add(newDistrict);

        emit(AddNewDistrictState());
      }
    });

    on<ValidateNewDistrictValuesAndUpdateCoreDataEvent>((event, emit) async {
      coreData.cities[selectedCityIndex].districts[event.index] =
          event.district;

      Either<Failure, Unit> eitherFailureOrUnit = await updateCoreDataUseCase
          .call(coreDataModel: CoreDataModel.fromDomain(coreData));

      if (eitherFailureOrUnit.isLeft()) {
        //TODO: in case of Failure

      }
      emit(DistrictUpdatedState(districtIndex: event.index));
    });
  }

  late final CoreData coreData;
  late List<ProductCategory> categories;
  late List<Packung> packungen;
  late List<City> cities;

  String selectedCity = '';
  int selectedCityIndex = 0;
  List<DataRow> districtsDataRow = [];

  District newDistrict = District(name: 'Stadtteil', transferPrice: 0);
}
