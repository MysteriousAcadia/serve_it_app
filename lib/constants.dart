import 'package:flutter/painting.dart';
class Constants{
  //DEFINE COLORS
  static Color primaryColor=const Color(0xff7ddbe4);
  static Color accentColor = const Color(0xff7ddbe4);
  static Color white = const Color(0xffffffff);
  static Color green = const Color(0xff20bf55);
  static Color primaryText = const Color(0xff000000);
  static Color accentText = const Color(0xffffffff);
  static Color transparent = const Color(0x00000000);

  //DEFINE DIMENSIONS
static BorderRadius buttonBorderRadius =  BorderRadius.circular(10.0);

// DEFINE TEXTSTYLE
static TextStyle buttonTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 20,
  color: primaryText,
//  fontWeight: FontWeight.w300,
);
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);


}