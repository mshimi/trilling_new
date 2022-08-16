
import 'package:flutter/material.dart';

import 'package:trilling_web/core/utils/colors.dart';

class AppTextFormField extends StatelessWidget {
  final double width;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String labelText;
  final TextEditingController? controller;
  const AppTextFormField({
    Key? key,
    this.validator,
    this.onChanged,
    this.controller,
    required this.width,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: width,
      child: TextFormField(
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          label: Text(labelText),
          floatingLabelStyle: const TextStyle(color: Colors.black),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: blueColor1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: blueColor1),
          ),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: blueColor1)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: blueColor1),
          ),
        ),
      ),
    );
  }
}
