import 'package:flutter/material.dart';
import 'package:trilling_web/features/core_feature/domain/entities/district.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';
import 'package:trilling_web/features/core_feature/presentation/widgets/city_table_header.dart';
import 'package:trilling_web/features/core_feature/presentation/widgets/city_table_row.dart';
import 'package:trilling_web/features/core_feature/presentation/widgets/city_table_row_new_item.dart';

import '../../../../core/utils/colors.dart';

class CityTable extends StatefulWidget {
  final double height;
  final CoreBloc coreBloc;
  List<bool> isEditable = [];
  String? errorText;
  int listLenght;
  CityTable(
      {Key? key,
      required this.height,
      required this.coreBloc,
      required this.listLenght})
      : super(key: key);

  @override
  State<CityTable> createState() => _CityTableState();
}

class _CityTableState extends State<CityTable> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: blueColor1),
            ),
            child: Column(
              children: [
                const CityTableHeader(),
                SizedBox(
                  height: 1,
                  child: Container(
                    color: blueColor1,
                  ),
                ),
                SizedBox(
                  height: widget.height * 0.30,
                  child: ListView.separated(
                    controller: ScrollController(),
                    itemCount: widget.listLenght,
                    itemBuilder: (context, index) {
                      widget.isEditable.add(false);
                      District district = widget
                          .coreBloc
                          .coreData
                          .cities[widget.coreBloc.selectedCityIndex]
                          .districts[index];

                      TextEditingController textEditingController =
                          TextEditingController();

                      textEditingController.text =
                          district.transferPrice.toString();
                      String? errorText;

                      if (district.name == 'Stadtteil') {
                        TextEditingController districtNameController =
                            TextEditingController();
                        TextEditingController transferPriceController =
                            TextEditingController();

                        // TODO: add new CityTableRowForNewItem;
                        return CityTableRowNewItem(
                          districtNameController: districtNameController,
                          transferPriceController: transferPriceController,
                          onSave: () {
                            if (districtNameController.text != 'Stadtteil' &&
                                isNumeric(transferPriceController.text)) {
                              District district = District(
                                  name: districtNameController.text,
                                  transferPrice: double.parse(
                                      transferPriceController.text));
                              widget.coreBloc.add(
                                  ValidateNewDistrictValuesAndUpdateCoreDataEvent(
                                      district: district, index: index));
                            }
                          },
                          onDelete: () {
                         
                            widget.coreBloc.add(
                                DistrictDeletedEvent(districtIndex: index));
                          },
                        );
                      }

                      return CityTableRow(
                        errorText: widget.errorText,
                        controller: textEditingController,
                        onEdit: () {
                          setState(() {
                            widget.isEditable[index] =
                                !widget.isEditable[index];
                          });
                        },
                        onSave: () {
                          if (isNumeric(textEditingController.text)) {
                            widget.errorText = null;
                            widget.coreBloc.add(DistrictChangedEvent(
                                districtIndex: index,
                                transferPrice:
                                    double.parse(textEditingController.text)));

                            widget.isEditable[index] = false;
                          } else {
                            widget.errorText = 'ungültiges Wert';
                          }
                          setState(() {});
                        },
                        onCancel: () {
                          setState(() {
                            widget.isEditable[index] =
                                !widget.isEditable[index];
                            widget.errorText = null;
                          });
                        },
                        districtName: district.name,
                        isEditable: widget.isEditable[index],
                        transferPrice: district.transferPrice.toString(),
                        onDelete: () {
                          widget.coreBloc
                              .add(DistrictDeletedEvent(districtIndex: index));
                        },
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 1,
                      child: Container(
                        color: blueColor1,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
