import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/core/presentation/widgets/app_textformfield.dart';
import 'package:trilling_web/core/utils/colors.dart';
import 'package:trilling_web/core/utils/strings.dart';
import 'package:trilling_web/features/client_feature/domain/entities/adresse.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';
import 'package:trilling_web/features/client_feature/presentation/bloc/new_client_bloc/new_client_bloc.dart';
import 'package:trilling_web/features/client_feature/presentation/widgets/new_client.dart/auftragsgeber_radio.dart';
import 'package:trilling_web/injection.dart';

class NewClientPage extends StatelessWidget {
  const NewClientPage({Key? key}) : super(key: key);

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
        body: BlocBuilder<NewClientBloc, NewClientState>(
          builder: (context, state) {
            NewClientBloc newClientBloc =
                BlocProvider.of<NewClientBloc>(context);
            String auftragsgeber = state.auftragsgeberType.name;

            TextEditingController nameController = TextEditingController();
            TextEditingController firstNameController = TextEditingController();
            TextEditingController phoneController = TextEditingController();
            TextEditingController emailController = TextEditingController();
            TextEditingController streetController = TextEditingController();
            return Container(
              height: height * 2,
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        color: blueColor1,
                      )),
                  Expanded(
                    flex: 14,
                    child: Container(
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
                                width: width * 0.09,
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
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Container(
                        color: blueColor1,
                      )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
