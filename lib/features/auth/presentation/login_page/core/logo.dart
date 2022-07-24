import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Logo extends StatelessWidget {
  BoxFit boxFit;

   Logo({Key? key, this.boxFit  = BoxFit.contain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Image.asset(
        'assets/images/trillin_logo.png',
        fit: boxFit,
      ),
    );
  }
}
