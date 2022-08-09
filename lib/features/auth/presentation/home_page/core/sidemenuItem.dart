import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilling_web/core/utils/colors.dart';

class SideMenuItem extends StatefulWidget {
  double height;
  String text;
  IconData iconData;
  Function onTap;
  bool iselected;

  SideMenuItem({
    Key? key,
    required this.iselected,
    required this.onTap,
    required this.iconData,
    required this.height,
    required this.text,
  }) : super(key: key);

  @override
  State<SideMenuItem> createState() => _SideMenuItemState();
}

class _SideMenuItemState extends State<SideMenuItem> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.contextMenu,
      child: InkWell(
        onTap: () {
          setState(() {
            widget.onTap();
          });
        },
        child: AnimatedContainer(
          curve: Curves.decelerate,
          duration: const Duration(milliseconds: 500),
          height: widget.height / 15,
          width: double.infinity,
          // padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                spreadRadius: .5,
                color: Colors.white,
                blurRadius: 3,
                blurStyle: BlurStyle.normal,
                offset: Offset(-2.3, 0),
              ),
            ],
            color: widget.iselected ? blueColor1 : darkGrey,
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  widget.iconData,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  widget.text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
