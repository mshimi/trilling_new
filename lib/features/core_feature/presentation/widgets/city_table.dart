import 'package:flutter/material.dart';
import 'package:trilling_web/features/core_feature/domain/entities/district.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/core_bloc.dart';
import 'package:trilling_web/features/core_feature/presentation/widgets/city_table_header.dart';
import 'package:trilling_web/features/core_feature/presentation/widgets/city_table_row.dart';

import '../../../../core/utils/colors.dart';

class CityTable extends StatefulWidget {
  final double height;
  final CoreBloc coreBloc;
  List<bool> isEditable = [];
  CityTable({Key? key, required this.height, required this.coreBloc})
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
                  height: widget.height * 0.5,
                  child: ListView.separated(
                    controller: ScrollController(),
                    itemCount: widget
                        .coreBloc
                        .coreData
                        .cities[widget.coreBloc.selectedCityIndex]
                        .districts
                        .length,
                    itemBuilder: (context, index) {
                      widget.isEditable.add(false);
                      District district = widget
                          .coreBloc
                          .coreData
                          .cities[widget.coreBloc.selectedCityIndex]
                          .districts[index];
                      return CityTableRow(
                        onEdit: () {
                          setState(() {
                            widget.isEditable[index] =
                                !widget.isEditable[index];
                          });
                        },
                        districtName: district.name,
                        isEditable: widget.isEditable[index],
                        transferPrice: district.transferPrice.toString(),
                        onDelete: () {
                          widget
                              .coreBloc
                              .coreData
                              .cities[widget.coreBloc.selectedCityIndex]
                              .districts
                              .removeAt(index);
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
}
