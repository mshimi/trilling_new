import 'package:flutter/material.dart';
import 'package:trilling_web/features/core_feature/domain/entities/district.dart';

class CityTableBuilder {
  final List<District> districts;

  CityTableBuilder({required this.districts});

  List<DataRow> buildDataRow() {
    List<DataRow> dataRows = [];
    for (var i = 0; i < districts.length; i++) {
      District district = districts[i];
      dataRows.add(buildCityDataRow(district: district, index: i));
    }
    return dataRows;
  }

  DataRow buildCityDataRow({
    required District district,
    required int index,
    bool isEditable = false,
  }) {
    return DataRow(
      cells: [
        DataCell(Text(district.name)),
        DataCell(
          !isEditable
              ? TextFormField(
                  initialValue: district.transferPrice.toString(),
                
                )
              : Text(
                  district.transferPrice.toString(),
                ),
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  isEditable = !isEditable;
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {},
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        )
      ],
    );
  }
}
