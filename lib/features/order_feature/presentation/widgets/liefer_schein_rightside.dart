import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilling_web/core/utils/colors.dart';
import 'package:trilling_web/features/order_feature/data/models/topfe_model.dart';
import 'package:trilling_web/features/order_feature/presentation/widgets/topf_item.dart';

class RightSideLieferSchein extends StatelessWidget {
  final double height;
  final TopflisteModel topfModel;

  const RightSideLieferSchein({Key? key, required this.height, required this.topfModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    List<Map<String, int>> topfe = topfModel.topfeAsMap();

    return Expanded(
      flex: 4,
      child: Container(
        height: height,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'geliefertes Equpment',
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: blueColor1, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: topfe.length,
                    controller: ScrollController(),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      late String topfName;
                      late int count;

                      topfe[index].forEach(
                        (key, value) {
                          topfName = key;
                          count = value;
                        },
                      );
                      return TopItem(topfName: topfName, count: count);
                    }))
          ],
        ),
      ),
    );
  }
}
