import 'package:flutter/material.dart';


class CityTableColumnCell extends StatelessWidget {
  final BorderDirectional borderDirectional;
  final String text;
  const CityTableColumnCell(
      {Key? key, required this.borderDirectional, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            height: 35,
            decoration: BoxDecoration(border: borderDirectional),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white),
              ),
            )));
  }
}
