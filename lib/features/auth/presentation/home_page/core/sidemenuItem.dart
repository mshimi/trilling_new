// ignore: file_names
import 'package:flutter/material.dart';

class SideMenuItem extends StatefulWidget {
  final double height;
  final String text;
  final IconData iconData;
  const SideMenuItem(
      {Key? key,
      required this.height,
      required this.text,
      required this.iconData})
      : super(key: key);

  @override
  State<SideMenuItem> createState() => _SideMenuItemState(
      height: this.height, text: text, iconData: this.iconData);
}

class _SideMenuItemState extends State<SideMenuItem> {
  double height;
  final String text;
  final IconData iconData;
  _SideMenuItemState(
      {required this.height, required this.text, required this.iconData});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 15,
      width: double.infinity,
      // padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: .5,
            color: Colors.black,
            blurRadius: 3,
            blurStyle: BlurStyle.normal,
            offset: Offset(-2.3, 0),
          ),
        ],
        color: Colors.blueGrey,
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.home,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
