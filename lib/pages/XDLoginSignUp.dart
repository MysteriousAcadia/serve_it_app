import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './XDBarsAppleiOSUIBarsStatusBariPhoneXSOnLight.dart';

class XDLoginSignUp extends StatelessWidget {
  XDLoginSignUp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
              child: Transform.translate(
            offset: Offset(0, 100),
            child: SvgPicture.string(_svg_8isoop,
                allowDrawingOutsideViewBox: true),
          )),
          Container(
            child: Center(
              child: Column(
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
                  ),
                  SizedBox(
                    width: 164.0,
                    child: Text(
                      'Lorem Ipsum',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(53.0, 470.5),
            child:
                // Adobe XD layer: 'Titles' (group)
                Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(53.0, 0.0),
                ),
                Transform.translate(
                  offset: Offset(0.0, 42.0),
                  child:
                      // Adobe XD layer: 'Lorem ipsum dolor si' (text)
                      SizedBox(
                    width: 270.0,
                    height: 54.0,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidi.',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(115.0, 95.0),
          ),
          Transform.translate(
            offset: Offset(167.0, 158.0),
            child: SizedBox(
              width: 42.0,
            ),
          ),
          Transform.translate(
            offset: Offset(57.0, 615.0),
            child: Container(
              width: 262.0,
              height: 55.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(154.5, 688.5),
            child:
                // Adobe XD layer: 'SKIP' (text)
                SizedBox(
              width: 66.0,
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(163.5, 633.5),
            child:
                // Adobe XD layer: 'SKIP' (text)
                SizedBox(
              width: 48.0,
              child: Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
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
