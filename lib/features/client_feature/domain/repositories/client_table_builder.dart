import 'package:flutter/material.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';

class ClientTableBuilder {
  final List<Client> clientList;

  ClientTableBuilder({required this.clientList});

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
        ],
      );
      tabelrows.add(dataRow);
    }

    return tabelrows;
  }

  List<DataColumn> buildColumns() {
    return <DataColumn>[
    const  DataColumn(
        label: Text('Id'),
      ),
      DataColumn(label:const Text('Name'), onSort: ((columnIndex, ascending) {})),
     const DataColumn(label: Text('Vorname')),
    const  DataColumn(label: Text('Stadt')),
   const   DataColumn(label: Text('Stadtteil')),
   const   DataColumn(label: Text('Straße')),
   const   DataColumn(label: Text('HouseNumber')),
  const    DataColumn(label: Text('Postcode')),
    ];
  }
}
