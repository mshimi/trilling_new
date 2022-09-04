import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RightSideLieferSchein extends StatelessWidget {
  final double height;

  const RightSideLieferSchein({Key? key, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        color: Colors.red,
        height: height,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
