import 'package:flutter/material.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';
import 'package:trilling_web/features/client_feature/presentation/widgets/client_table_cell.dart';

class ClientTableBuilder {
  final List<Client> clientList;

  ClientTableBuilder({required this.clientList});

  List<DataRow> buildTableRow() {
    List<DataRow> tabelrows = [];

    clientList.forEach((element) {
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
        ],
      );
      tabelrows.add(dataRow);
    });

    return tabelrows;
  }

  List<DataColumn> buildColumns() {
    return <DataColumn>[
      DataColumn(
        label: Text('Id'),
      ),
      DataColumn(label: Text('Name'), onSort: ((columnIndex, ascending) {})),
      DataColumn(label: Text('Vorname')),
      DataColumn(label: Text('Stadt')),
      DataColumn(label: Text('Stadtteil')),
      DataColumn(label: Text('Straße')),
      DataColumn(label: Text('HouseNumber')),
      DataColumn(label: Text('Postcode')),
    ];
  }
}
