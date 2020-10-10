import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/utils/constants.dart';
import 'package:serveit/pages/auth/signin_page.dart';
import 'package:serveit/pages/auth/signup_page.dart';

class Splash extends StatelessWidget {
  Splash({
    Key key,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Main Stack
      backgroundColor: Constants.primaryColor,
    );
  }
}


