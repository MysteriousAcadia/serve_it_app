import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/constants.dart';
import 'package:serveit/pages/XDLoginSelected.dart';
import './XDBarsAppleiOSUIBarsStatusBariPhoneXSOnLight.dart';

class XDLoginSignUp extends StatelessWidget {
  XDLoginSignUp({
    Key key,
  }) : super(key: key);

  void goToLogin(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>XDLoginSelected()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Main Stack
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
              //Background
              child: Transform.translate(
            offset: Offset(0, 150),
            child: SvgPicture.string(_svg_8isoop,
                allowDrawingOutsideViewBox: true),
          )),
          //Logo at top
          Transform.translate(
              offset: Offset(0, 100),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 145.0,
                      height: 145.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(72.5, 72.5)),
                        color: const Color(0xff7ddbe4),
                      ),
                      child: Center(
                        child: Text(
                          'Logo',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            color: const Color(0xffffffff),
                            letterSpacing: -0.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ])),
          //MAIN TITLE, SUMMARY, LOGIN SIGNUP
          Container(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Transform.translate(
                    offset: Offset(0, -70),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal:2.0,vertical:30.0),
                          width: 164.0,
                          child: Text(
                            'Main logo text',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10,6.0,10,50),
                          child:
                        Text(
                          'A very long description like: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidi.',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.center,
                        )),

                          Button("Login", Constants.white,
                              Constants.primaryText, ()=> {
                            goToLogin(context)
                          })
                        ,
                        Button("Signup", Constants.transparent, Constants.white,
                            goToLogin),
                      ],
                    ))),

          ),

        ],
      ),
    );
  }
}

Widget _signInButton() {
  return OutlineButton(
    splashColor: Colors.grey,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    highlightElevation: 0,
    borderSide: BorderSide(color: Colors.grey),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage("assets/google_logo.jpg"), height: 35.0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Sign in with Google',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

const String _svg_8isoop =
    '<svg viewBox="0.0 269.0 375.0 548.0" ><path transform="translate(0.0, 161.0)" d="M 0 253.0003662109375 L 375 108.0400390625 L 375 656 L 0 656 L 0 253.0003662109375 Z" fill="#64c6cf" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_1i58gx =
    '<svg viewBox="184.8 767.3 7.2 13.2" ><path transform="translate(184.8, 767.31)" d="M 7.165123462677002 13.1683349609375 L 0 6.58416748046875 L 7.165123462677002 0 L 7.165123462677002 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /></svg>';
