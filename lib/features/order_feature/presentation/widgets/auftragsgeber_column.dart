import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'auftragsgeber_item.dart';

class AuftragsGeberColumn extends StatelessWidget {
  BoxDecoration boxDecoration;
  List<AuftragsGeberItem> auftragsgeberItems;
  AuftragsGeberColumn(
      {Key? key, required this.boxDecoration, required this.auftragsgeberItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: auftragsgeberItems,
      ),
    );
  }
}
