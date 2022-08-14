import 'package:flutter/cupertino.dart';
import 'package:trilling_web/core/utils/colors.dart';

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

  TextStyle headerTextStyle = TextStyle(fontWeight: FontWeight.bold);
  TextStyle rowTextStyle = TextStyle();
}
