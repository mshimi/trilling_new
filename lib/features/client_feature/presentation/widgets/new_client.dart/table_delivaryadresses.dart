import 'package:data_tables/data_tables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/core/presentation/widgets/app_dorpdown_button.dart';
import 'package:trilling_web/core/utils/lists.dart';
import 'package:trilling_web/features/client_feature/presentation/widgets/new_client.dart/cities_dropdown.dart';
import 'package:trilling_web/features/client_feature/presentation/widgets/new_client.dart/districts_dropdown.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';

import '../../../domain/entities/adresse.dart';
import '../../bloc/new_client_bloc/new_client_bloc.dart';

class TableDelivaryAdresse extends StatelessWidget {
  final double height;
  final CoreBloc coreBloc;
  List<Adresse> listOfDelivaryAdresses;
  final double width;
  TableDelivaryAdresse({
    super.key,
    required this.height,
    required this.coreBloc,
    required this.listOfDelivaryAdresses,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewClientBloc, NewClientState>(
      buildWhen: (previous, current) {
        return previous.isClientAdresseLiferAdresse !=
            current.isClientAdresseLiferAdresse;
      },
      builder: (context, state) {
        if (state.isClientAdresseLiferAdresse == true) {
          return Container(height: 0);
        }
        return Container(
            height: height * 0.5,
            child: NativeDataTable.builder(
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          listOfDelivaryAdresses.add(Adresse(
                              city: 'Bochum',
                              district: 'Altenbochum',
                              zipCode: 0,
                              houseNumber: '',
                              street: 'street'));
                        },
                        icon: Icon(Icons.add))
                  ],
                ),
                columns: delivaryAdressesColumn,
                itemCount: state.listOfDelivaryAdresses.length,
                itemBuilder: (index) {
                  Adresse adresse = listOfDelivaryAdresses[index];

                  return DataRow(cells: [
                    DataCell(CitesDropDown(
                        cities: coreBloc.cities,
                        selectedCity: adresse.city,
                        width: width,
                        onchanged: (v) {
                          state.listOfDelivaryAdresses[index].city =
                              v.toString();
                        })),
                    DataCell(DistrictsDropDown(
                      cities: coreBloc.cities,
                      currentDistrict: adresse.district,
                      currentCity: adresse.city,
                      width: width,
                      onchanged: (v) {},
                    )),
                    DataCell(Text('data')),
                    DataCell(Text('data')),
                    DataCell(Text('data')),
                  ]);
                }));
      },
    );
  }
}
