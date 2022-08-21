import 'package:flutter/material.dart';

import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';
import 'package:trilling_web/features/core_feature/presentation/widgets/city_table.dart';
import 'package:trilling_web/features/core_feature/presentation/widgets/side_menu_city.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CoreBloc coreBloc = BlocProvider.of<CoreBloc>(context);
    double height = context.getHeight();
    // ignore: unused_local_variable
    double width = context.getWidth();

    return BlocBuilder<CoreBloc, CoreState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(8),
          // height: height * 1.7,
          child: ListView(
            controller: ScrollController(),
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  height: (height * 0.76),
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: blueColor1),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Lieferung Preise',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: blueColor1),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: height * 0.60,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SideMenuCity(coreBloc: coreBloc, height: height),
                            CityTable(
                              height: height,
                              coreBloc: coreBloc,
                              listLenght: coreBloc
                                  .coreData
                                  .cities[coreBloc.selectedCityIndex]
                                  .districts
                                  .length,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppElevatedButton(
                            width: width * 0.17,
                            text: 'Stadtteil hinzufügen',
                            iconData: Icons.add,
                            onTap: () {
                              coreBloc.add(AddNewDistrictEvent());
                            },
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        );
      },
    );
  }
}
