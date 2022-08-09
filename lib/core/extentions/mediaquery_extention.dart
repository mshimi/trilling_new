

import 'package:flutter/material.dart';


extension MediaQueryValues on BuildContext {


  double getWidth({int dividedOn = 1}) => MediaQuery.of(this).size.width/ dividedOn;

 double getHeight({int dividedOn = 1}) => MediaQuery.of(this).size.height / dividedOn;

}