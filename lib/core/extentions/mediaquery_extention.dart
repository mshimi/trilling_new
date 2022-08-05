

import 'package:flutter/material.dart';


extension MediaQueryValues on BuildContext {


  double getWidth() => MediaQuery.of(this).size.width;

 double getHeight() => MediaQuery.of(this).size.height;

}