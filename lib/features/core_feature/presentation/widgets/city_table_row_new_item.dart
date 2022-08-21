import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityTableRowNewItem extends StatelessWidget {
  final TextEditingController districtNameController;
  final TextEditingController transferPriceController;
  final Function() onSave;
  final Function() onDelete;
  const CityTableRowNewItem({
    Key? key,
    required this.districtNameController,
    required this.transferPriceController,
    required this.onSave,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  border: BorderDirectional(end: BorderSide())),
              child: TextFormField(
                controller: districtNameController,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  // errorText: errorText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(border: InputBorder.none),
              controller: transferPriceController,
            ),
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                border: BorderDirectional(start: BorderSide())),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: onSave,
                  icon: Icon(Icons.save),
                  tooltip: 'speichern',
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  tooltip: 'löschen',
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
