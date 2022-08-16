import 'package:flutter/material.dart';

class CityTableRow extends StatelessWidget {
  final Function() onEdit;
  final Function() onDelete;
  final String districtName;
  final bool isEditable;
  final String transferPrice;
  const CityTableRow({
    Key? key,
    required this.onDelete,
    required this.onEdit,
    required this.districtName,
    required this.isEditable,
    required this.transferPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  border: BorderDirectional(end: BorderSide())),
              child: Center(
                child: Text(
                  districtName,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: !isEditable
                  ? Text(
                      transferPrice,
                    )
                  : TextFormField(
                      initialValue: transferPrice,
                    ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  border: BorderDirectional(start: BorderSide())),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: onEdit, icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: onDelete, icon: const Icon(Icons.delete))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
