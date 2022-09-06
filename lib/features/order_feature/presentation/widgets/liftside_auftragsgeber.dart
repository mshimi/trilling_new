import 'package:flutter/material.dart';
import 'package:trilling_web/features/order_feature/domain/entities/order.dart';
import 'package:trilling_web/features/order_feature/presentation/widgets/auftragsgeber_column.dart';
import 'package:trilling_web/features/order_feature/presentation/widgets/auftragsgeber_item.dart';
import 'package:trilling_web/core/extentions/datetime_extention.dart';

class LiftSideAuftragsGeber extends StatelessWidget {
  final double height;
  final Order order;
  const LiftSideAuftragsGeber(
      {Key? key, required this.height, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration boxDecoration = BoxDecoration(
      border: Border.all(
        width: 1,
      ),
    );

    return Container(
      height: height,
      decoration: boxDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AuftragsGeberColumn(
            boxDecoration: boxDecoration,
            auftragsgeberItems: [
              AuftragsGeberItem(
                boxDecoration: boxDecoration,
                titel: 'Trilling GmbH',
                subTitel: 'Auftragsgeber',
              ),
              AuftragsGeberItem(
                boxDecoration: boxDecoration,
                titel: '${order.client.name}, ${order.client.firstName}',
                subTitel: 'Name',
              ),
              AuftragsGeberItem(
                boxDecoration: boxDecoration,
                titel:
                    '${order.client.clientAdresse.street}, ${order.client.clientAdresse.houseNumber}',
                subTitel: 'Straße',
              ),
              AuftragsGeberItem(
                boxDecoration: boxDecoration,
                titel:
                    '${order.client.clientAdresse.zipCode}, ${order.client.clientAdresse.district}, ${order.client.clientAdresse.city}, ',
                subTitel: 'PLZ/Wohnort',
              ),
              AuftragsGeberItem(
                boxDecoration: boxDecoration,
                titel: '${order.client.telephone}',
                subTitel: 'Telefon',
              ),
              AuftragsGeberItem(
                boxDecoration: boxDecoration,
                titel: '${order.client.email}',
                subTitel: 'Email',
              ),
              AuftragsGeberItem(
                boxDecoration: boxDecoration,
                titel: '',
                subTitel: 'Anlass',
              ),
            ],
          ),
          AuftragsGeberColumn(
            boxDecoration: boxDecoration,
            auftragsgeberItems: [
              AuftragsGeberItem(
                boxDecoration: boxDecoration,
                titel: order.eventDate.getStringDate(),
                subTitel: 'Liefertermin am',
              ),
              AuftragsGeberItem(
                boxDecoration: boxDecoration,
                titel:
                    '${order.bringen.timeFrom.getStringTime()} und ${order.bringen.timeTo.getStringTime()}',
                subTitel: 'Uhrzeit zwischen',
              ),
              AuftragsGeberItem(
                boxDecoration: boxDecoration,
                titel: 'Media Market',
                subTitel: 'Veranstalltungsort',
              ),
              AuftragsGeberItem(
                boxDecoration: boxDecoration,
                titel: '${order.delivaryAdresse.street}, ${order.delivaryAdresse.houseNumber}',
                subTitel: 'Straße',
              ),
              AuftragsGeberItem(
                boxDecoration: boxDecoration,
                titel: '${order.delivaryAdresse.zipCode}, ${order.delivaryAdresse.city}, ${order.delivaryAdresse.district},',
                subTitel: 'PLZ/Wohnort',
              ),
              AuftragsGeberItem(
                boxDecoration: boxDecoration,
                titel: '01066009893',
                subTitel: 'Telephone',
              ),
              AuftragsGeberItem(
                boxDecoration: boxDecoration,
                titel: '${order.notes}',
                subTitel: 'Notes',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
