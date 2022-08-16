import 'package:flutter/material.dart';

import 'package:trilling_web/features/auth/presentation/home_page/core/side_menu_item.dart';
import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/core_feature/domain/entities/core_data.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/core_bloc.dart';
import 'package:trilling_web/features/core_feature/presentation/widgets/city_table.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CoreBloc coreBloc = BlocProvider.of<CoreBloc>(context);
    CoreData coreData = coreBloc.coreData;
    double height = context.getHeight();
    double width = context.getWidth();

    return BlocBuilder<CoreBloc, CoreState>(
      builder: (context, state) {
        return Container(
          padding:const EdgeInsets.all(8),
          height: height * 1.7,
          child: ListView(
            controller: ScrollController(),
            children: [
              Text(
                'Lieferung Preise',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: blueColor1),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                height: height * 0.7,
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: blueColor1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                          itemCount: coreBloc.coreData.cities.length,
                          itemBuilder: (context, index) {
                           
                            return SideMenuItem(
                                iselected: coreBloc.selectedCityIndex == index,
                                onTap: () {
                                  coreBloc.add(CityIndexChanged(index: index));
                                },
                                iconData: Icons.location_city,
                                height: height,
                                text: coreBloc.coreData.cities[index].name);
                          }),
                    ),
                    CityTable(height: height, coreBloc: coreBloc)
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
