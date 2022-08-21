import 'package:flutter/material.dart';

class CityTableRow extends StatelessWidget {
  final Function() onEdit;
  final Function() onDelete;
  final Function() onSave;
  final Function() onCancel;
  String? errorText;
  final TextEditingController controller;
  final String districtName;
  final bool isEditable;
  final String transferPrice;
  CityTableRow({
    Key? key,
    this.errorText,
    required this.controller,
    required this.onDelete,
    required this.onEdit,
    required this.districtName,
    required this.isEditable,
    required this.transferPrice,
    required this.onCancel,
    required this.onSave,
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
                      controller: controller,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        errorText: errorText,
                        border: InputBorder.none,
                      ),
                    ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  border: BorderDirectional(start: BorderSide())),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: isEditable
                    ? [
                        IconButton(
                          onPressed: onSave,
                          icon: const Icon(Icons.save),
                          tooltip: 'speichern',
                        ),
                        IconButton(
                          onPressed: onCancel,
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                          tooltip: 'cancel',
                        ),
                      ]
                    : [
                        IconButton(
                          onPressed: onEdit,
                          icon: const Icon(Icons.edit),
                          tooltip: 'ändern',
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
            ),
          ),
        ],
      ),
    );
  }
}
