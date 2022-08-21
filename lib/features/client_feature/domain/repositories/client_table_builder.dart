import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';
import 'package:trilling_web/features/client_feature/export.dart';

class ClientTableBuilder {
  final List<Client> clientList;
  final BuildContext context;

  ClientTableBuilder({
    required this.clientList,
    required this.context,
  });

  List<DataRow> buildTableRow() {
    List<DataRow> tabelrows = [];

    for (var element in clientList) {
      DataRow dataRow = DataRow(
        cells: [
          DataCell(Text(element.id)),
          DataCell(Text(element.name)),
          DataCell(Text(element.firstName)),
          DataCell(Text(element.clientAdresse.city)),
          DataCell(Text(element.clientAdresse.district)),
          DataCell(Text(element.clientAdresse.street)),
          DataCell(Text(element.clientAdresse.houseNumber)),
          DataCell(Text(element.clientAdresse.zipCode.toString())),
          DataCell(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    String clientId = element.id;
                    GoRouter.of(context).go(
                      '/Clients/$clientId',
                      extra: element,
                    );
                  },
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart),
                )
              ],
            ),
          )
        ],
      );
      tabelrows.add(dataRow);
    }

    return tabelrows;
  }

  List<DataColumn> buildColumns() {
    return <DataColumn>[
      const DataColumn(
        label: Text('Id'),
      ),
      DataColumn(
          label: const Text('Name'), onSort: ((columnIndex, ascending) {})),
      const DataColumn(label: Text('Vorname')),
      const DataColumn(label: Text('Stadt')),
      const DataColumn(label: Text('Stadtteil')),
      const DataColumn(label: Text('Straße')),
      const DataColumn(label: Text('HouseNumber')),
      const DataColumn(label: Text('Postcode')),
      const DataColumn(label: Text('Actions')),
    ];
  }
}
