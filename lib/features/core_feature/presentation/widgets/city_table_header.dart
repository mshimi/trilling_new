import 'package:flutter/material.dart';
import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/core_feature/presentation/widgets/city_table_column_cell.dart';

class CityTableHeader extends StatelessWidget {
  const CityTableHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      
         
          color: blueColor1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children:const [
          CityTableColumnCell(
              borderDirectional: BorderDirectional(end: BorderSide()),
              text: 'StadtTeil'),
          CityTableColumnCell(
              borderDirectional: BorderDirectional(), text: 'Price'),
          CityTableColumnCell(
              borderDirectional: BorderDirectional(start: BorderSide()),
              text: 'Action'),
        ],
      ),
    );
  }
}
