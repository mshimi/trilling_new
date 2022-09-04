import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final BoxFit boxFit;
final  EdgeInsetsGeometry edgeInsetsGeometry;

  const Logo({Key? key, this.boxFit = BoxFit.contain, this.edgeInsetsGeometry = const EdgeInsets.symmetric(horizontal: 16, vertical: 32)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: edgeInsetsGeometry,
      child: Image.asset(
        'assets/images/trillin_logo.png',
        fit: boxFit,
      ),
    );
  }
}
