import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DividerWidget extends StatelessWidget {
   double height;
   double? width;

   DividerWidget({super.key, this.height = 10 , this.width});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: height,
      width: width,
    );
  }
}
