import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuftragsGeberItem extends StatelessWidget {
  final BoxDecoration boxDecoration;
 final String subTitel;
 final String titel;
  const AuftragsGeberItem({
    Key? key,
    required this.boxDecoration,
    required this.subTitel,
    required this.titel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: boxDecoration,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                subTitel,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(titel),
            )
          ],
        ),
      ),
    );
  }
}
