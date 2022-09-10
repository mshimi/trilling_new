import 'package:data_tables/data_tables.dart';
import 'package:flutter/material.dart';
import 'package:trilling_web/core/utils/lists.dart';
import 'package:trilling_web/features/auth/domain/repositries/auth_repo.dart';
import 'package:trilling_web/features/auth/presentation/login_page/bloc/auth_bloc/auth_bloc.dart';
import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/client_feature/presentation/bloc/clients_page_bloc/clients_page_bloc.dart';
import 'package:trilling_web/features/client_feature/presentation/bloc/new_client_bloc/new_client_bloc.dart';
import 'package:trilling_web/features/client_feature/presentation/widgets/new_client.dart/auftragsgeber_radio.dart';
import 'package:trilling_web/features/client_feature/presentation/widgets/new_client.dart/table_delivaryadresses.dart';
import 'package:trilling_web/features/client_feature/presentation/widgets/new_client.dart/tablestatefulltest.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';
import 'package:trilling_web/features/product_feature/presentation/pages/new_product_page.dart';
import 'package:trilling_web/injection.dart';

class NewClientPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController zipController = TextEditingController();

  TextEditingController houseNrController = TextEditingController();

  NewClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Client client = Client(
        firstName: 'firstName',
        name: 'name',
        id: 'id',
        clientAdresse: Adresse(
            city: 'Bochum',
            street: '',
            zipCode: 44556,
            district: '',
            houseNumber: '12'),
        createdBy: 'createdBy',
        createdOn: DateTime.now());

    double width = context.getWidth();

    double height = context.getHeight();
    return BlocProvider(
      create: (context) => sl.get<NewClientBloc>(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: blueColor1,
          title: const Text('Neuer Kunde hinzufügen'),
        ),
        body: BlocListener<NewClientBloc, NewClientState>(
          listener: (context, state) {
            if (state is ClientRegestredState) {
              BlocProvider.of<ClientsPageBloc>(context)
                  .tableContent
                  .insert(0, state.client);
              context.pop();
            }
          },
          child: BlocBuilder<NewClientBloc, NewClientState>(
            builder: (context, state) {
              NewClientBloc newClientBloc =
                  BlocProvider.of<NewClientBloc>(context);
              CoreBloc coreBloc = BlocProvider.of<CoreBloc>(context);

              List<String> cities = coreBloc.cities.map((e) => e.name).toList();
              late List<String> districts;
              state.selectedCity ??= cities[0];

              coreBloc.coreData.cities.forEach((element) {
                if (state.selectedCity == element.name) {
                  districts = element.districts.map((e) => e.name).toList();
                  state.selectedDistrict =
                      districts.contains(state.selectedDistrict)
                          ? state.selectedDistrict
                          : districts[0];
                }
              });

              String auftragsgeber = state.auftragsgeberType.name;

              return Container(
                color: blueColor1,
                child: Center(
                  child: Container(
                    width: width * 0.75,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: ListView(
                          children: [
                            AuftragsGebersTypeRadio(
                              onChange: (v) {
                                newClientBloc.add(
                                    AuftragsGeberChanged(auftragsgeberType: v));
                              },
                              groupValue: auftragsgeber,
                              width: width,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: width * 0.09,
                                  child: Text(
                                    'Name: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                AppTextFormField(
                                  controller: nameController,
                                  width: width * 0.30,
                                  labelText: 'Name',
                                  onChanged: (v) {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: width * 0.09,
                                  child: Text(
                                    'Vorname: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                AppTextFormField(
                                  controller: firstNameController,
                                  width: width * 0.30,
                                  labelText: 'Vorname',
                                  onChanged: (v) {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: width * 0.09,
                                  child: Text(
                                    'Email: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                AppTextFormField(
                                  controller: emailController,
                                  width: width * 0.30,
                                  labelText: 'Email',
                                  onChanged: (v) {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: width * 0.09,
                                  child: Text(
                                    'Telephone: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                AppTextFormField(
                                  controller: phoneController,
                                  width: width * 0.30,
                                  labelText: 'Telephone',
                                  onChanged: (v) {},
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Kunden Adresse',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(color: blueColor1),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: width * 0.09,
                                  child: Text(
                                    'Straße: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                AppTextFormField(
                                  controller: streetController,
                                  width: width * 0.30,
                                  labelText: 'Straße',
                                  onChanged: (v) {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: width * 0.09,
                                  child: Text(
                                    'House Nr.',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                AppTextFormField(
                                  controller: houseNrController,
                                  width: width * 0.30,
                                  labelText: 'House Nr.',
                                  onChanged: (v) {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: width * 0.09,
                                  child: Text(
                                    'Zip',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                AppTextFormField(
                                  controller: zipController,
                                  width: width * 0.30,
                                  labelText: 'Zip',
                                  onChanged: (v) {},
                                ),
                              ],
                            ),
                            
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: width * 0.09,
                                  child: Text(
                                    'Stadt',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                AppDorpDownButton(
                                    width: width * 0.30,
                                    dropDownMenuItems: coreBloc.cities
                                        .map((e) => DropdownMenuItem(
                                              value: e.name,
                                              child: Text(
                                                e.name,
                                              ),
                                            ))
                                        .toList(),
                                    value: state.selectedCity,
                                    onChanged: (v) {
                                      newClientBloc.add(
                                          CityChanged(cityName: v.toString()));
                                    })
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: width * 0.09,
                                  child: Text(
                                    'Stadtteil',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                AppDorpDownButton(
                                    width: width * 0.30,
                                    dropDownMenuItems: districts
                                        .map((e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                              ),
                                            ))
                                        .toList(),
                                    value: state.selectedDistrict,
                                    onChanged: (v) {
                                      newClientBloc.add(DistrictChanged(
                                          districtName: v.toString()));
                                    })
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: state.isClientAdresseLiferAdresse,
                                    onChanged: (v) {
                                
                                      newClientBloc.add(
                                          IsClientAdresseLiferAdresseChanged(
                                              isClientAdresseLiferAdresse: v!));
                                    }),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Kundenadresse ist gleich Lieferadresse',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            TableDelivaryAdresses(
                              width: width,
                              height: height,
                              coreBloc: coreBloc,
                              listOfDelivaryAdresses:
                                  state.listOfDelivaryAdresses,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                AppElevatedButton(
                                  width: width * 0.2,
                                  text: 'Kunden hinzufügen',
                                  iconData: Icons.add,
                                  onTap: () {
                                    Adresse clientAdresse = Adresse(
                                        city: state.selectedCity!,
                                        district: state.selectedDistrict!,
                                        zipCode:
                                            int.tryParse(zipController.text)!,
                                        houseNumber: houseNrController.text,
                                        street: streetController.text);
                                    Client client = Client(
                                        email: emailController.text,
                                        telephone: phoneController.text,
                                        deliveryAdresse:
                                            state.listOfDelivaryAdresses,
                                        firstName: firstNameController.text,
                                        name: nameController.text,
                                        id: '',
                                        clientAdresse: clientAdresse,
                                        createdBy: sl.get<Auth_Repo>().currentAppUser()!.id,
                                        createdOn: DateTime.now());
                                    newClientBloc.add(
                                        AddClientButtonEvent(client: client));
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
