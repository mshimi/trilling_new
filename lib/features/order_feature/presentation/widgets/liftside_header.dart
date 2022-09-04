import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilling_web/features/auth/presentation/login_page/core/logo.dart';

class LiftSideHeader extends StatelessWidget {
  final double height;
  const LiftSideHeader({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            'Auftrags / LieferSchein',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: Colors.black,
                ),
          )),
          Expanded(
            child: Logo(
              edgeInsetsGeometry: EdgeInsets.all(0),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bochumer Straße 140',
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  '44866 Bochum Wattenscheid',
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  'Telefon (0 23 27) 8 73 70 ',
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  'Telefax (0 23 27) 8 67 54',
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  'www.trilling-partyervice.de',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
