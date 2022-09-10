import 'package:flutter/material.dart';

class ChoiceInpuNewProduct extends StatelessWidget {
  final double width;
  final double height;
  final String titel;
  List<String> items;
  final String value;
  void Function(String?)? onchanged;

  // BlocProvider.of<CoreBloc>(context).coreData.categories.map((e) => e.name).toList();

  ChoiceInpuNewProduct(
      {super.key,
      required this.value,
      required this.items,
      required this.height,
      required this.width,
      required this.titel,
      required this.onchanged});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> dropDownMenuItems = items
        .map((item) => DropdownMenuItem(
              value: item,
              child: Text(item),
            ))
        .toList();

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
        SizedBox(
          width: width * 0.3,
          child: DropdownButtonFormField(
            value: value,
            items: dropDownMenuItems,
            onChanged: onchanged,
          ),
        )
      ],
    );
  }
}
