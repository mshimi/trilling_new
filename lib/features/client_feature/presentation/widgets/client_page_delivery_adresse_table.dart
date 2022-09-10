import 'package:data_tables/data_tables.dart';
import 'package:flutter/material.dart';
import 'package:trilling_web/core/utils/colors.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';

import '../../../../core/presentation/widgets/app_elevatedbutton.dart';
import '../../../../core/utils/lists.dart';

class ClientPageDeliveryAdresse extends StatelessWidget {
  final Client client;
  final double width;
  const ClientPageDeliveryAdresse(
      {Key? key, required this.client, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
   
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
        decoration: BoxDecoration(
          border: Border.all(color: blueColor1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: NativeDataTable.builder(
                    header: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lieferung Adresse',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: blueColor1),
                        ),
                        AppElevatedButton(
                          width: width * 0.15,
                          text: 'Lieferung Adresse',
                          iconData: Icons.add,
                          onTap: () {},
                        ),
                      ],
                    ),
                    columns: delivaryAdressesColumn,
                    itemCount: client.deliveryAdresse == null
                        ? 0
                        : client.deliveryAdresse!.length,
                    itemBuilder: (index) {
                      return DataRow(cells: [
                        DataCell(Text(client.deliveryAdresse![index].city)),
                        DataCell(Text(client.deliveryAdresse![index].district)),
                        DataCell(Text(client.deliveryAdresse![index].street)),
                        DataCell(
                            Text(client.deliveryAdresse![index].houseNumber)),
                        DataCell(Text(
                            client.deliveryAdresse![index].zipCode.toString())),
                      ]);
                    })),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
