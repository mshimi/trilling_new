import 'package:flutter/material.dart';


class Logo extends StatelessWidget {
 final BoxFit boxFit;

 const  Logo({Key? key, this.boxFit  = BoxFit.contain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Image.asset(
        'assets/images/trillin_logo.png',
        fit: boxFit,
      ),
    );
  }
}
