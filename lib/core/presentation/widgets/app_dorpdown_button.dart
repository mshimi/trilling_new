import 'package:flutter/material.dart';


class AppDorpDownButton extends StatelessWidget {
  final List<DropdownMenuItem<Object>>? dropDownMenuItems;
  final double width;
  final dynamic value;
  final Function(Object?)? onChanged;

  const AppDorpDownButton({
    Key? key,
    required this.dropDownMenuItems,
    required this.width,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: width,
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
            border: OutlineInputBorder()),
        items: dropDownMenuItems,
        onChanged: onChanged,
        value: value,
      ),
    );
  }
}
