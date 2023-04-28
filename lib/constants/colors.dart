import 'package:flutter/material.dart';

class MyColors{
  static const Color primaryColor = Color(0xffFAF250);
  static const Color backgroundColor = Color(0xffDAE0DF);
  static const Color greyText = Color(0xff545454);
  static const Color divider = Color(0xffCCCCCC);
  static const Color lightblack = Color(0xff313131);
  static const Color lightgrey = Color(0xffF1F1F1);
  static const Color textgrey2 = Color(0xff575757);
  static const Color orange = Color(0xffFAA500);
  static const Color green = Color(0xff128933);
  static const Color red = Color(0xffFA0000);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color transparent = Colors.transparent;

}

class MyGradients{
  static  LinearGradient linearGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment(0.1, 3),
    colors: [
      Color(0xFFffffff),
      Color(0xFF72BD74).withOpacity(0.5),
    ],
  );
}
