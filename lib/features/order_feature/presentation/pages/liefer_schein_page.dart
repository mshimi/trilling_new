import 'package:flutter/material.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/features/order_feature/domain/entities/order.dart';

import 'package:trilling_web/features/order_feature/presentation/widgets/liefer_schein_liftside.dart';
import 'package:trilling_web/features/order_feature/presentation/widgets/liefer_schein_rightside.dart';

import '../../../../core/utils/colors.dart';


class LieferScheinPage extends StatelessWidget {
  final Order orderItem;
  const LieferScheinPage({Key? key, required this.orderItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = context.getWidth();
    double height = context.getHeight();

    double papirHeight = (width * 0.7) * 1.4175;
    double papirWidth = (width * 0.7);

    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 4,
            child: Container(
              color: blueColor1,
              height: height,
            )),
        Expanded(
          flex: 14,
          child: Container(
            color: Colors.white,
            height: height,
            child: SingleChildScrollView(
              child: Container(
                height: papirHeight,
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    LiftSideLieferSchein(
                      height: papirHeight * 0.7, order: orderItem,
                    ),
                    RightSideLieferSchein(
                      height: papirHeight * 0.7,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 4,
            child: Container(
              color: blueColor1,
              height: height,
            ))
      ],
    ));
  }
}
