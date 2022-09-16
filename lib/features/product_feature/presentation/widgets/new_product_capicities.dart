import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/features/product_feature/data/models/packung_model.dart';
import 'package:trilling_web/features/product_feature/domain/entities/packung.dart';
import 'package:trilling_web/features/product_feature/domain/entities/product_capicity.dart';
import 'package:trilling_web/features/product_feature/presentation/capicity_data_ui_controller.dart';

import '../../../../core/utils/colors.dart';

class ProductCapicitiesInput extends StatefulWidget {
  final TextEditingController _minPaxController = TextEditingController();
  final TextEditingController _maxPaxController = TextEditingController();
  ProductCapicitiesInput(
      {super.key,
      required this.packungen,
      required this.titel,
      required this.capicityList});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<ProductCapicitiesInput> createState() => _ProductCapicitiesInputState();

  final String titel;

  final List<Packung> packungen;
  final CapicityList capicityList;
}

class _ProductCapicitiesInputState extends State<ProductCapicitiesInput> {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<Packung>> packungs = widget.packungen.map((e) {
      PackungModel packungModel = PackungModel.fromDomain(e);

      return DropdownMenuItem(
        value: e,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            packungModel.packungValueToSymbole(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(' ${e.name}')
        ]),
      );
    }).toList();

    currentPackung ??= widget.packungen[1];

    return Row(children: [
      Container(
        alignment: Alignment.topLeft,
        width: context.getWidth() * 0.09,
        child: Text(
          widget.titel,
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
      Flexible(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: blueColor1),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: widget.formKey,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: widget._minPaxController,
                        validator: (value) {
                          if (int.tryParse(value!) == null) {
                            return 'null';
                          } else if (int.parse(widget._maxPaxController.text) <
                              int.parse(widget._minPaxController.text)) {
                            return 'falsche Eingabe';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: widget._maxPaxController,
                        validator: (v) {
                          //   if (int.tryParse(v!) != null) {
                          //     return 'falsche Eingabe';
                          //   } else {
                          //     return null;
                          //   }

                          if (v == null) {
                            return 'null';
                          } else if (int.tryParse(v) == null) {
                            return 'falsche Eingabe';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 1,
                      child: DropdownButton(
                        items: packungs,
                        onChanged: (v) {
                          setState(() {
                            currentPackung = v as Packung;
                          });
                        },
                        value: currentPackung,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () async {
                              // print(widget.formKey.currentState!.validate());
                              if (widget.formKey.currentState!.validate()) {
                                print('if valid');
                                ProductCapicity productCapicity =
                                    ProductCapicity(
                                        minPax: int.parse(
                                            widget._minPaxController.text),
                                        maxPax: int.parse(
                                            widget._maxPaxController.text),
                                        packung: currentPackung!);
                                widget.capicityList
                                    .addCapicity(productCapicity);

                                setState(() {});

                                widget._maxPaxController.clear();
                                widget._minPaxController.clear();
                              } else {
                                // setState(() {});
                              }
                            },
                            icon: const Icon(Icons.add)),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.cancel))
                      ],
                    ))
                  ],
                ),
              ),
              SizedBox(height: 8),
              Flexible(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: blueColor4),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.all(8),
                                color: blueColor1,
                                alignment: Alignment.center,
                                child: Text('min. Pax')),
                          ),
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.all(8),
                                color: blueColor1,
                                alignment: Alignment.center,
                                child: Text('max. Pax')),
                          ),
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.all(8),
                                color: blueColor1,
                                alignment: Alignment.center,
                                child: Text('Topf')),
                          ),
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.all(8),
                                color: blueColor1,
                                alignment: Alignment.center,
                                child: Text('Wert')),
                          ),
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.all(8),
                                color: blueColor1,
                                alignment: Alignment.center,
                                child: Text('Löschen')),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                        child: ListView.separated(
                            itemBuilder: (ontext, index) {
                              ProductCapicity capicity =
                                  widget.capicityList.capicities[index];
                              return Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        padding: EdgeInsets.all(8),
                                        color: blueColor1,
                                        alignment: Alignment.center,
                                        child: Text('${capicity.minPax}')),
                                  ),
                                  Expanded(
                                    child: Container(
                                        padding: EdgeInsets.all(8),
                                        color: blueColor1,
                                        alignment: Alignment.center,
                                        child: Text('${capicity.maxPax}')),
                                  ),
                                  Expanded(
                                    child: Container(
                                        padding: EdgeInsets.all(8),
                                        color: blueColor1,
                                        alignment: Alignment.center,
                                        child:
                                            Text('${capicity.packung.name}')),
                                  ),
                                  Expanded(
                                    child: Container(
                                        padding: EdgeInsets.all(8),
                                        color: blueColor1,
                                        alignment: Alignment.center,
                                        child:
                                            Text('${capicity.packung.value}')),
                                  ),
                                  Expanded(
                                    child: Container(
                                        padding: EdgeInsets.all(8),
                                        color: blueColor1,
                                        alignment: Alignment.center,
                                        child: IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            widget.capicityList
                                                .removeItem(capicity);
                                          },
                                        )),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 1,
                                ),
                            itemCount: widget.capicityList.capicities.length)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  Packung? currentPackung;
}
