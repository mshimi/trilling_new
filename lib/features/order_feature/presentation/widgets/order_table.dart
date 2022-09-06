import 'package:data_tables/data_tables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:trilling_web/core/extentions/datetime_extention.dart';
import 'package:trilling_web/features/order_feature/domain/entities/order.dart';

class OrderTable extends StatelessWidget {
  final List<Order> orders;
  const OrderTable({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return NativeDataTable.builder(
      columns: [
        DataColumn(label: Text('Bestellungsnummer')),
        DataColumn(label: Text('Bestellungsdatum')),
        DataColumn(label: Text('Anlassdatum')),
        DataColumn(label: Text('Lieferung')),
        DataColumn(label: Text('Abholung')),
        DataColumn(label: Text('Auftragsgeber')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Actions')),
      ],
      itemCount: orders.length,
      itemBuilder: (index) => DataRow(
        cells: [
          DataCell(
            Text(orders[index].id!),
          ),
          DataCell(
            Text(orders[index].bookingDate.getStringDate()),
          ),
          DataCell(
            Text(orders[index].eventDate.getStringDate()),
          ),
          DataCell(
            Text(orders[index].delivaryBooked.toString()),
          ),
          DataCell(
            Text(orders[index].collectionBooked.toString()),
          ),
          DataCell(
            Text(
                '${orders[index].client.name}, ${orders[index].client.firstName}'),
          ),
          DataCell(
            Text(orders[index].totalPrice.toString()),
          ),
          DataCell(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Order order = orders[index];
                    String clientId = order.client.id;
                    String orderId = order.id ?? 'neworder';
                    context.go('/Clients/$clientId/lieferscheid/$orderId',
                        extra: order);
                  },
                  icon: const Icon(Icons.assignment),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
