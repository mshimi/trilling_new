import 'package:flutter/material.dart';
import '../../../../../core/presentation/widgets/app_dorpdown_button.dart';
import '../../../../core_feature/domain/entities/city.dart';

class CitesDropDown extends StatelessWidget {
  final List<City> cities;
  final String selectedCity;
  final double width;
  final Function(Object?)? onchanged;
  const CitesDropDown({
    super.key,
    required this.cities,
    required this.selectedCity,
    required this.width,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {

    

    return AppDorpDownButton(
        width: width * 0.13,
        dropDownMenuItems: cities
            .map((e) => DropdownMenuItem(
                  value: e.name,
                  child: Text(
                    e.name,
                  ),
                ))
            .toList(),
        value: selectedCity,
        onChanged: onchanged,);
  }
}
