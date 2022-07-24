import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextAnmelden extends StatelessWidget {
  final double maxWidth;
  final Alignment alignment;
  const TextAnmelden({
    Key? key,
    this.maxWidth = double.infinity,
    this.alignment = Alignment.center
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Text(
        'Anmelden',
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: Colors.blueGrey),
      ),
    );
  }
}
