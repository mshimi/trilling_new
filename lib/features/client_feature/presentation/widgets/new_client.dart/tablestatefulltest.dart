import 'package:data_tables/data_tables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/core/presentation/widgets/app_dorpdown_button.dart';
import 'package:trilling_web/core/utils/lists.dart';
import 'package:trilling_web/features/client_feature/presentation/widgets/new_client.dart/cities_dropdown.dart';
import 'package:trilling_web/features/client_feature/presentation/widgets/new_client.dart/districts_dropdown.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';

import '../../../domain/entities/adresse.dart';
import '../../bloc/new_client_bloc/new_client_bloc.dart';

class TableDelivaryAdresses extends StatefulWidget {
  final double height;
  final CoreBloc coreBloc;
  List<Adresse> listOfDelivaryAdresses;
  final double width;

  bool isEditable = true;
  TableDelivaryAdresses({
    super.key,
    required this.height,
    required this.coreBloc,
    required this.listOfDelivaryAdresses,
    required this.width,
  });

  @override
  State<TableDelivaryAdresses> createState() => _TableDelivaryAdresseState();
}

class _TableDelivaryAdresseState extends State<TableDelivaryAdresses> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewClientBloc, NewClientState>(
      buildWhen: (previous, current) {
        return previous.isClientAdresseLiferAdresse !=
            current.isClientAdresseLiferAdresse;
      },
      builder: (context, state) {
        if (state.isClientAdresseLiferAdresse == true) {
          return Container(height: 0);
        }

        return Container(
            height: widget.height * 0.5,
            child: NativeDataTable.builder(
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            widget.isEditable = true;
                            widget.listOfDelivaryAdresses.insert(
                                0,
                                Adresse(
                                    city: 'Bochum',
                                    district: 'Altenbochum',
                                    zipCode: 44444,
                                    houseNumber: '',
                                    street: ''));

                            
                          });
                        },
                        icon: Icon(Icons.add))
                  ],
                ),
                columns: delivaryAdressesColumn,
                itemCount: widget.listOfDelivaryAdresses.length,
                itemBuilder: (index) {
                  Adresse adresse = widget.listOfDelivaryAdresses[index];
                  TextEditingController streetController =
                      TextEditingController();
                  TextEditingController houseController =
                      TextEditingController();
                  TextEditingController zipController = TextEditingController();

                  streetController.text =
                      widget.listOfDelivaryAdresses[index].street;
                  houseController.text =
                      widget.listOfDelivaryAdresses[index].houseNumber;
                  zipController.text =
                      widget.listOfDelivaryAdresses[index].zipCode.toString();

                  if (index == 0 && widget.isEditable) {
                    return DataRow(cells: [
                      DataCell(CitesDropDown(
                          cities: widget.coreBloc.cities,
                          selectedCity: adresse.city,
                          width: widget.width,
                          onchanged: (v) {
                            setState(() {
                              adresse.city = v.toString();
                              widget.coreBloc.cities.forEach((element) {
                                if (element.name == adresse.city) {
                                  adresse.district = element.districts[0].name;
                                }
                              });
                            });
                          })),
                      DataCell(DistrictsDropDown(
                        cities: widget.coreBloc.cities,
                        currentDistrict: adresse.district,
                        currentCity: adresse.city,
                        width: widget.width,
                        onchanged: (v) {
                          adresse.district = v.toString();
                        },
                      )),
                      DataCell(TextFormField(
                        onChanged: (v) {
                          widget.listOfDelivaryAdresses[index].street = v;
                        },
                        controller: streetController,
                        decoration: InputDecoration(border: InputBorder.none),
                      )),
                      DataCell(TextFormField(
                        onChanged: (v) {
                          widget.listOfDelivaryAdresses[index].houseNumber = v;
                        },
                        controller: houseController,
                        decoration: InputDecoration(border: InputBorder.none),
                      )),
                      DataCell(TextFormField(
                        onChanged: (v) {
                          widget.listOfDelivaryAdresses[index].zipCode =
                              int.parse(v);
                        },
                        controller: zipController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      )),
                      DataCell(Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.isEditable = false;
                                });
                              },
                              icon: Icon(Icons.save)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.listOfDelivaryAdresses.removeAt(index);
                                });
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      ))
                    ]);
                  } else {
                    return DataRow(cells: [
                      DataCell(Text(widget.listOfDelivaryAdresses[index].city)),
                      DataCell(
                          Text(widget.listOfDelivaryAdresses[index].district)),
                      DataCell(
                          Text(widget.listOfDelivaryAdresses[index].street)),
                      DataCell(Text(
                          widget.listOfDelivaryAdresses[index].houseNumber)),
                      DataCell(Text(widget.listOfDelivaryAdresses[index].zipCode
                          .toString())),
                      DataCell(
                        IconButton(
                            onPressed: () {
                              setState(() {
                                widget.listOfDelivaryAdresses.removeAt(index);
                              });
                            },
                            icon: Icon(Icons.delete)),
                      ),
                    ]);
                  }
                }));
      },
    );
  }
}
