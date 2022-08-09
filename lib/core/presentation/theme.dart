import 'package:flutter/material.dart';
import 'package:trilling_web/core/utils/colors.dart';

class AppTheme {


  static  final TextStyle _lightHeadingText =  TextStyle(
      color: whiteColor,
      fontFamily: "Rubik",
      fontSize: 20,
      fontWeight: FontWeight.bold);

  static final  TextStyle _lightBodyText = TextStyle(
      color: blackColor,
      fontFamily: "Rubik",
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      fontSize: 16);

  static const TextStyle _lightBodyText2 = TextStyle(
      color: Colors.black,
      fontFamily: "Rubik",
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.normal,
      fontSize: 16);

  static final TextTheme _lightTextTheme = TextTheme(
    headline1: _lightHeadingText,
    bodyText1: _lightBodyText,
    bodyText2: _lightBodyText2,
  );
  
  static get blueColor1 => null;

  static InputDecoration getinPutDecoration({
    required String label,
  }) {
    return InputDecoration(
      labelText: label,
    );
  }

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
          floatingLabelStyle: const TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)));

  static const Color _iconColor = Colors.white;

  static const Color _accentColorDark = Color.fromARGB(255, 212, 125, 24);

  static final ThemeData lightTheme = ThemeData(
    inputDecorationTheme: _inputDecorationTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        color: blueColor1,
        iconTheme: const IconThemeData(color: _iconColor)),
    bottomAppBarColor: blueColor1,
   
    textTheme: _lightTextTheme,
  );
}
