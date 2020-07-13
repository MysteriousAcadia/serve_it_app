import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serveit/constants.dart';

class Button extends StatelessWidget {
  String text;
  Color buttonColor, textColor;
  Function onPressButton;
  void onPress()
  {
    onPressButton();
  }

  Button(this.text, this.buttonColor, this.textColor, this.onPressButton);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Constants.primaryColor,
        onTap: onPress,
        child: Container(
          margin: EdgeInsets.all(6.0),
          width: 262.0,
          height: 60.0,
        padding: EdgeInsets.symmetric(vertical:20.0,horizontal:40.0),
          decoration: BoxDecoration(
            borderRadius: Constants.buttonBorderRadius,
            color: buttonColor,
          ),
          child: Center(child:Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              color: textColor,
//              fontWeight: FontWeight.w300,
            )),
          ),
        ));
  }
}
