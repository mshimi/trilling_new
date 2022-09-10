import 'package:flutter/material.dart';

import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/client_feature/presentation/bloc/client_page_bloc/client_page_bloc.dart';
import 'package:trilling_web/features/core_feature/domain/entities/core_data.dart';
import 'package:trilling_web/features/core_feature/domain/entities/district.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';

class ClientPageContactInfomation extends StatelessWidget {
  final Function()? onEdit;
  final Function()? onSave;
  final Function()? onCancel;
  // final   List<String> cities;
  // final  List<String> distracts;
  final double width;
  final double height;
  final Client client;
  final bool isEnabled;

  final TextEditingController nameController;
  final TextEditingController firstNameController;
  final TextEditingController telephoneController;
  final TextEditingController emailController;
  final TextEditingController streetController;
  final TextEditingController housNumberController;
  final TextEditingController zipCodeController;
  final TextEditingController cityController;
  const ClientPageContactInfomation(
      {Key? key,
      required this.onSave,
      required this.onCancel,
      required this.onEdit,
      required this.cityController,
      required this.emailController,
      required this.firstNameController,
      required this.housNumberController,
      required this.nameController,
      required this.streetController,
      required this.telephoneController,
      required this.zipCodeController,
      required this.client,
      required this.height,
      required this.isEnabled,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    nameController.text = client.name;
    firstNameController.text = client.firstName;
    telephoneController.text = client.telephone ??= ' ';
    emailController.text = client.email ??= ' ';
    streetController.text = client.clientAdresse.street;
    zipCodeController.text = client.clientAdresse.zipCode.toString();
    housNumberController.text = client.clientAdresse.houseNumber;
    cityController.text = client.clientAdresse.city;
    ClientPageBloc clientPageBloc = BlocProvider.of<ClientPageBloc>(context);
    CoreBloc coreBloc = BlocProvider.of<CoreBloc>(context);

    String cityName = clientPageBloc.client!.clientAdresse.city;

    List<String> districts = [];
    coreBloc.cities.forEach(
      (element) {
        if (element.name == cityName) {
          districts = element.districts.map((e) => e.name).toList();
        }
      },
    );

    String district = client.clientAdresse.district;

    if (!districts.contains(district)) {
      district = districts[0];
      clientPageBloc.client!.clientAdresse.district = district;
    }

    return Container(
      padding: const EdgeInsets.all(12),
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
              isEnabled == false
                  ? AppElevatedButton(
                      onTap: onEdit,
                      width: width * 0.13,
                      text: 'Bearbeiten',
                      iconData: Icons.edit)
                  : Row(children: [
                      AppElevatedButton(
                          onTap: onSave,
                          width: width * 0.13,
                          text: 'Speichern',
                          iconData: Icons.save),
                      const SizedBox(
                        width: 5,
                      ),
                      AppElevatedButton(
                          onTap: onCancel,
                          width: width * 0.13,
                          text: 'züruck',
                          iconData: Icons.arrow_back)
                    ]),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              AppTextFormField(
                labelstyle: const TextStyle(
                    color: blueColor1, fontWeight: FontWeight.bold),
                enabled: isEnabled,
                width: width / 5,
                labelText: 'Name',
                controller: nameController,
              ),
              SizedBox(
                width: width / 20,
              ),
              AppTextFormField(
                labelstyle: const TextStyle(
                    color: blueColor1, fontWeight: FontWeight.bold),
                enabled: isEnabled,
                width: width / 8,
                labelText: 'Straße',
                controller: streetController,
              ),
              const SizedBox(
                width: 5,
              ),
              AppTextFormField(
                labelstyle: const TextStyle(
                    color: blueColor1, fontWeight: FontWeight.bold),
                enabled: isEnabled,
                width: width / 10,
                labelText: 'Housnummer',
                controller: housNumberController,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              AppTextFormField(
                labelstyle: const TextStyle(
                    color: blueColor1, fontWeight: FontWeight.bold),
                enabled: isEnabled,
                width: width / 5,
                labelText: 'Vorname',
                controller: firstNameController,
              ),
              SizedBox(
                width: width / 20,
              ),
              isEnabled
                  ? AppDorpDownButton(
                      dropDownMenuItems: coreBloc.cities.map((city) {
                        return DropdownMenuItem(
                          value: city.name.toString(),
                          child: Text(city.name),
                        );
                      }).toList(),
                      width: width / 8,
                      value: cityName,
                      onChanged: (v) {
                        clientPageBloc.add(CityChangedEvent(
                            city: v.toString(),
                            coreData:
                                BlocProvider.of<CoreBloc>(context).coreData));
                      })
                  : AppTextFormField(
                      labelstyle: const TextStyle(
                          color: blueColor1, fontWeight: FontWeight.bold),
                      enabled: isEnabled,
                      width: width / 8,
                      labelText: 'Stadt',
                      controller: TextEditingController(
                          text: client.clientAdresse.city),
                    ),
              const SizedBox(
                width: 5,
              ),
              AppTextFormField(
                labelstyle: const TextStyle(
                    color: blueColor1, fontWeight: FontWeight.bold),
                enabled: isEnabled,
                width: width / 10,
                labelText: 'Postcode',
                controller: zipCodeController,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              AppTextFormField(
                labelstyle: const TextStyle(
                    color: blueColor1, fontWeight: FontWeight.bold),
                enabled: isEnabled,
                width: width / 5,
                labelText: 'Telephone',
                controller: telephoneController,
              ),
              SizedBox(
                width: width / 20,
              ),
              isEnabled
                  ? AppDorpDownButton(
                      dropDownMenuItems: districts
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      width: width / 5,
                      value: district,
                      onChanged: (v) {
                        clientPageBloc.client!.clientAdresse.district =
                            v.toString();

                        clientPageBloc.district = v.toString();
                      })
                  : AppTextFormField(
                      labelstyle: const TextStyle(
                          color: blueColor1, fontWeight: FontWeight.bold),
                      enabled: isEnabled,
                      width: width / 5,
                      labelText: 'Stadtteil',
                      controller: TextEditingController(
                          text: client.clientAdresse.district),
                    ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              AppTextFormField(
                labelstyle: const TextStyle(
                    color: blueColor1, fontWeight: FontWeight.bold),
                enabled: isEnabled,
                width: width / 5,
                labelText: 'Email',
                controller: emailController,
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

  List<District> getDistricts(CoreData coreData, String city) {
    List<District> districts = [];

    coreData.cities.forEach((element) {
      if (element.name == city) {
        districts = element.districts;
      }
    });

    return districts.map((district) => district).toList();
  }
}
