import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilling_web/core/presentation/widgets/app_elevatedbutton.dart';
import 'package:trilling_web/core/presentation/widgets/app_textformfield.dart';
import 'package:trilling_web/core/utils/colors.dart';

import '../../domain/entities/client.dart';

class ClientPageContactInfomation extends StatelessWidget {
  final Function()? onEdit;
  final double width;
  final double height;
  final Client client;
  final bool isEnabled;
  const ClientPageContactInfomation(
      {Key? key,
      required this.onEdit,
      required this.client,
      required this.height,
      required this.isEnabled,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: width * 0.55,
      decoration: BoxDecoration(
        border: Border.all(color: blueColor1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kontakt Infomraion',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: blueColor1),
              ),
              AppElevatedButton(
                  onTap: onEdit,
                  width: width * 0.13,
                  text: 'Bearbeiten',
                  iconData: Icons.edit),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              AppTextFormField(
                labelstyle:
                    TextStyle(color: blueColor1, fontWeight: FontWeight.bold),
                enabled: isEnabled,
                width: width / 5,
                labelText: 'Name',
                controller: TextEditingController(text: client.name),
              ),
              SizedBox(
                width: width / 20,
              ),
              AppTextFormField(
                labelstyle:
                    TextStyle(color: blueColor1, fontWeight: FontWeight.bold),
                enabled: isEnabled,
                width: width / 8,
                labelText: 'Straße',
                controller:
                    TextEditingController(text: client.clientAdresse.street),
              ),
              SizedBox(
                width: 5,
              ),
              AppTextFormField(
                labelstyle:
                    TextStyle(color: blueColor1, fontWeight: FontWeight.bold),
                enabled: isEnabled,
                width: width / 10,
                labelText: 'Housnummer',
                controller: TextEditingController(
                    text: client.clientAdresse.houseNumber),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              AppTextFormField(
                labelstyle:
                    TextStyle(color: blueColor1, fontWeight: FontWeight.bold),
                enabled: isEnabled,
                width: width / 5,
                labelText: 'Vorname',
                controller: TextEditingController(text: client.firstName),
              ),
              SizedBox(
                width: width / 20,
              ),
              AppTextFormField(
                labelstyle:
                    TextStyle(color: blueColor1, fontWeight: FontWeight.bold),
                enabled: isEnabled,
                width: width / 8,
                labelText: 'Stadt',
                controller:
                    TextEditingController(text: client.clientAdresse.city),
              ),
              SizedBox(
                width: 5,
              ),
              AppTextFormField(
                labelstyle:
                    TextStyle(color: blueColor1, fontWeight: FontWeight.bold),
                enabled: isEnabled,
                width: width / 10,
                labelText: 'Postcode',
                controller:
                    TextEditingController(text: client.clientAdresse.city),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              AppTextFormField(
                labelstyle:
                    TextStyle(color: blueColor1, fontWeight: FontWeight.bold),
                enabled: isEnabled,
                width: width / 5,
                labelText: 'Telephone',
                controller: TextEditingController(
                    text: client.telephone == '' ? ' ' : client.telephone),
              ),
              SizedBox(
                width: width / 20,
              ),
              AppTextFormField(
                labelstyle:
                    TextStyle(color: blueColor1, fontWeight: FontWeight.bold),
                enabled: isEnabled,
                width: width / 5,
                labelText: 'Stadtteil',
                controller:
                    TextEditingController(text: client.clientAdresse.district),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              AppTextFormField(
                labelstyle:
                    TextStyle(color: blueColor1, fontWeight: FontWeight.bold),
                enabled: isEnabled,
                width: width / 5,
                labelText: 'Email',
                controller: TextEditingController(
                    text: client.email == '' ? ' ' : client.email),
              ),
              SizedBox(
                width: width / 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
