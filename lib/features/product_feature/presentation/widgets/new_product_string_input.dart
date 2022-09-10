import 'package:flutter/material.dart';


import '../../../../core/presentation/widgets/app_textformfield.dart';

class StringInputNewProduct extends StatelessWidget {
  final double width;
  final TextEditingController controller;
  final String titel;
  const StringInputNewProduct(
      {super.key, required this.width, required this.controller, required this.titel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: width * 0.09,
          child: Text(
            titel,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        AppTextFormField(
          controller: controller,
          width: width * 0.30,
          labelText: titel,
          onChanged: (v) {},
        ),
      ],
    );
  }
}
