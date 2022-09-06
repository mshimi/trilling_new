import 'package:flutter/material.dart';
import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/client_feature/presentation/bloc/clients_page_bloc/clients_page_event.dart';
import 'package:trilling_web/features/core_feature/data/models/core_data_model.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';

import '../bloc/clients_page_bloc/clients_page_bloc.dart';

class ClientTableHeader extends StatelessWidget {
  final double width;
  final double height;
  final ClientsPageBloc clientPageBloc;
  const ClientTableHeader({
    Key? key,
    required this.width,
    required this.height,
    required this.clientPageBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> searchDropDown = [
      'Name',
      'Vorname',
      'Stadt',
      'Stadtteil',
      'Id'
    ];

    List<DropdownMenuItem<String>> searchDropDownMenuItem = searchDropDown
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: e,
            ))
        .toList();

    return SizedBox(
      height: height,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // AppTextFormField(
              //   labelText: 'Suchen',
              //   width: width * 0.20,
              //   controller: clientPageBloc.searchController,
              // ),
              // const SizedBox(
              //   width: 3,
              // ),
              AppDorpDownButton(
                  dropDownMenuItems: searchDropDownMenuItem,
                  width: width * 0.10,
                  value: searchDropDown[0],
                  onChanged: (v) {
                    clientPageBloc
                        .add(GetSearchByEvent(searchby: v.toString()));
                  }),
              const SizedBox(
                width: 3,
              ),
              searchField(clientPageBloc.searchby, context),
              const SizedBox(
                width: 3,
              ),
              IconButton(
                onPressed: () {
                  clientPageBloc.add(SearchClientEvent(
                      searchby: clientPageBloc.searchby,
                      searchKey: clientPageBloc.searchController.text));
                },
                icon: const Icon(Icons.search),
                color: blueColor1,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              ),
            ],
          ),
          AppElevatedButton(
            width: width * 0.15,
            text: 'Kunde hinzufügen',
            iconData: Icons.add,
            onTap: () {
              GoRouter.of(context).go('/Clients/newClient');
            },
          ),
        ],
      ),
    );
  }

  Widget searchField(String searchDropDown, BuildContext context) {
    if (searchDropDown == 'Stadt') {
      List<String> cities =
          CoreDataModel.fromDomain(BlocProvider.of<CoreBloc>(context).coreData)
              .cities
              .map((e) => e.name)
              .toList();

      List<DropdownMenuItem<String>> citiesDropDown = cities
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList();

      clientPageBloc.selectedCity = cities[0];
      return AppDorpDownButton(
        onChanged: (value) {
          clientPageBloc.selectedCity = value.toString();
        },
        dropDownMenuItems: citiesDropDown,
        value: clientPageBloc.selectedCity,
        width: width * 0.20,
      );
    } else if (searchDropDown == 'Stadtteil') {
      List<String> districts =
          CoreDataModel.fromDomain(BlocProvider.of<CoreBloc>(context).coreData)
              .getAllDistrictsNames();

      List<DropdownMenuItem<String>> districtsDropDown = districts
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList();

      clientPageBloc.selectedDistrict = districts[0];

      return AppDorpDownButton(
        onChanged: (value) {
          clientPageBloc.selectedDistrict = value.toString();
        },
        dropDownMenuItems: districtsDropDown,
        value: clientPageBloc.selectedDistrict,
        width: width * 0.20,
      );
    } else {
      return AppTextFormField(
        labelText: 'Suchen',
        width: width * 0.20,
        controller: clientPageBloc.searchController,
      );
    }
  }
}
