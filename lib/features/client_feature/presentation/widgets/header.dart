import 'package:flutter/material.dart';

import 'package:trilling_web/core/presentation/widgets/app_dorpdown_button.dart';
import 'package:trilling_web/core/presentation/widgets/app_elevatedbutton.dart';
import 'package:trilling_web/core/presentation/widgets/app_textformfield.dart';
import 'package:trilling_web/core/utils/colors.dart';
import 'package:trilling_web/features/client_feature/presentation/bloc/client_page_bloc/client_page_bloc.dart';

class ClientTableHeader extends StatelessWidget {
  final double width;
  final double height;
  final ClientPageBloc clientPageBloc;
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
      height: height * 0.05,
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
              searchField(clientPageBloc.searchby),
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
              iconData: Icons.add),
        ],
      ),
    );
  }

  Widget searchField(String searchDropDown) {
    if (searchDropDown == 'Stadt') {
      return Container();
    } else if (searchDropDown == 'Stadtteil') {
      return Container();
    } else {
      return AppTextFormField(
        labelText: 'Suchen',
        width: width * 0.20,
        controller: clientPageBloc.searchController,
      );
    }
  }
}
