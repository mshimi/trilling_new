import 'package:flutter/material.dart';

import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/core/utils/colors.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = context.getHeight();
    double width = context.getWidth();
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: blueColor1,
        alignment: Alignment.topCenter,
        child: Container(
          height: height,
          width: width * 0.75,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
