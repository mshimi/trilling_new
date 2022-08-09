import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/features/client_feature/domain/entities/adresse.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';

class ClientPage extends StatelessWidget {
  const ClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Client client = Client(
        firstName: 'firstName',
        name: 'name',
        id: 'id',
        clientAdresse: Adresse(
            city: '',
            street: '',
            zipCode: 44556,
            district: '',
            houseNumber: '12'),
        createdBy: 'createdBy',
        createdOn: 'createdOn');

    return SingleChildScrollView(
      child: Container(
        width: context.getWidth(),
        height: context.getHeight() * 2,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/neuerKunde');
                },
                child: Text('Kunde hinzufügen')),
          ],
        ),
      ),
    );
  }
}
