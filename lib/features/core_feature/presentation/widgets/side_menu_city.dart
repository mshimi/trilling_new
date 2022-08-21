import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilling_web/features/auth/presentation/home_page/core/side_menu_item.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';

class SideMenuCity extends StatelessWidget {
 final CoreBloc coreBloc;
 final double height;
  const SideMenuCity({
    Key? key,
    required this.coreBloc,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
