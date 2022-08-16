import 'package:flutter/cupertino.dart';

class ClientTableCell extends StatelessWidget {
  final String text;
  final bool isHeader;
  ClientTableCell({
    Key? key,
    required this.text,
    this.isHeader = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: isHeader ? headerTextStyle : rowTextStyle,
      ),
    );
  }

  TextStyle headerTextStyle =const TextStyle(fontWeight: FontWeight.bold);
  TextStyle rowTextStyle = const TextStyle();
}
