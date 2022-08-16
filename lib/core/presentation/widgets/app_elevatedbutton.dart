import 'package:flutter/material.dart';
import 'package:trilling_web/core/utils/colors.dart';

class AppElevatedButton extends StatelessWidget {
  
  final double width;
 final  Color backGroundColor;
 final String text;
 final IconData iconData;

 
  const AppElevatedButton({
    Key? key,
    required this.width,
    required this.text,
    required this.iconData,
    this.backGroundColor = blueColor1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backGroundColor)),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Icon(iconData), Text(text)],
        ),
      ),
    );
  }
}
