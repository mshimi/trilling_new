import 'package:flutter/material.dart';
import 'package:trilling_web/features/order_feature/domain/entities/order.dart';

import 'package:trilling_web/features/order_feature/presentation/widgets/liftside_auftragsgeber.dart';
import 'package:trilling_web/features/order_feature/presentation/widgets/liftside_header.dart';

class LiftSideLieferSchein extends StatelessWidget {
  final double height;
  final Order order;

  const LiftSideLieferSchein({Key? key, required this.height, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 14,
      child: Container(
        width: double.infinity,
        height: height,
        child: Column(
          children: [
            LiftSideHeader(
              height: height * 0.125,
            ),
            LiftSideAuftragsGeber(height: height * 0.35, order: order,),
          ],
        ),
      ),
    );
  }
}
