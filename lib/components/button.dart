import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serveit/constants.dart';

class Button extends StatelessWidget {
  String text;
  Color buttonColor;
  TextStyle textStyle;
  Function onPressButton;

  void onPress() {
    onPressButton();
  }

  Button(this.text, this.buttonColor, this.textStyle, this.onPressButton);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(6.0),
        child: Material(
            color: buttonColor,
            borderRadius: Constants.buttonBorderRadius,
            child: InkWell(
                borderRadius: Constants.buttonBorderRadius,
                splashColor: Constants.primaryColor,
                onTap: onPress,
                child: Container(
                  width: 262.0,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
                  child: Center(
                    child: Text(text,
                        textAlign: TextAlign.center, style: textStyle),
                  ),
                )
            )
        )
    );
  }
}
