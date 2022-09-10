import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilling_web/features/core_feature/domain/entities/city.dart';

import '../../../../../core/presentation/widgets/app_dorpdown_button.dart';

class DistrictsDropDown extends StatelessWidget {
  final List<City> cities;
  final String currentCity;
  String currentDistrict;
  double width;
  Function(Object?)? onchanged;

  DistrictsDropDown(
      {super.key,
      required this.cities,
      required this.currentCity,
      required this.currentDistrict,
      required this.width,
      this.onchanged});

  @override
  Widget build(BuildContext context) {
    List<String> districts = [];

    cities.forEach((e) {
      if (e.name == currentCity) {
        districts = e.districts.map((e) => e.name).toList();
      }
    });

    if (!districts.contains(currentDistrict)) {
      currentDistrict = districts[0];
    }

    return AppDorpDownButton(
        width: width * 0.14,
        dropDownMenuItems: districts
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                  ),
                ))
            .toList(),
        value: currentDistrict,
        onChanged: onchanged);
  }
}
