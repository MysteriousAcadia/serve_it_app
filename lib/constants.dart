import 'package:flutter/painting.dart';

class Constants {
  //DEFINE COLORS
  static Color primaryColor = const Color(0xff7ddbe4);
  static Color primaryColorLight = const Color(0xff8ac4cf);
  static Color googleRed = const Color(0xe76363);
  static Color accentColor = const Color(0xff7ddbe4);
  static Color white = const Color(0xffffffff);
  static Color green = const Color(0xff20bf55);
  static Color primaryText = const Color(0xff000000);
  static Color accentText = const Color(0xffffffff);
  static Color transparent = const Color(0x00000000);
  static List<Color> cardColors = [
    Color(0xffe8ebfe),
    Color(0xfff9e8e9),
    Color(0xffe8d8eb),
    Color(0xffdde5f2),
    Color(0xfff3d6e8),
    Color(0xfff9edda),
  ];

  //DEFINE DIMENSIONS
  static BorderRadius buttonBorderRadius = BorderRadius.circular(10.0);

// DEFINE TEXTSTYLE
  static TextStyle buttonTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20,
    color: primaryText,
//  fontWeight: FontWeight.w300,
  );
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

//URL AND NETWORKING
  static String BASE_URL = "https://serveit-backend.herokuapp.com/api/v1";
}
