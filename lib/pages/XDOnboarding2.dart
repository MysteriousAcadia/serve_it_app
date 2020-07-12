import 'package:flutter/material.dart';
import './XDBarsAppleiOSUIBarsStatusBariPhoneXSOnLight.dart';

class XDOnboarding2 extends StatelessWidget {
  XDOnboarding2({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(53.0, 506.5),
            child:
                // Adobe XD layer: 'Titles' (group)
                Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(53.0, 0.0),
                  child:
                      // Adobe XD layer: 'Select Date & Time' (text)
                      SizedBox(
                    width: 164.0,
                    child: Text(
                      'Lorem Ipsum',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        color: const Color(0xff444444),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
                        color: const Color(0xff444444),
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
            offset: Offset(17.0, 762.5),
            child:
                // Adobe XD layer: 'pagination' (group)
                Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(296.0, 0.0),
                  child:
                      // Adobe XD layer: 'NEXT' (text)
                      SizedBox(
                    width: 45.0,
                    height: 18.0,
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        color: const Color(0xff444444),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(-2.5, 0.0),
                  child:
                      // Adobe XD layer: 'SKIP' (text)
                      SizedBox(
                    width: 38.0,
                    child: Text(
                      'SKIP',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        color: const Color(0xff444444),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(145.0, 5.0),
                  child:
                      // Adobe XD layer: 'Bullets' (group)
                      Stack(
                    children: <Widget>[
                      // Adobe XD layer: 'Oval' (shape)
                      Container(
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(4.0, 4.0)),
                          color: const Color(0x6664c6cf),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(20.0, 0.0),
                        child:
                            // Adobe XD layer: 'Oval' (shape)
                            Container(
                          width: 8.0,
                          height: 8.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(4.0, 4.0)),
                            color: const Color(0xff64c6cf),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(40.0, 0.0),
                        child:
                            // Adobe XD layer: 'Oval' (shape)
                            Container(
                          width: 8.0,
                          height: 8.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(4.0, 4.0)),
                            color: const Color(0x6664c6cf),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 156.0),
            child: Container(
              width: 292.0,
              height: 292.0,
              decoration: BoxDecoration(
                color: const Color(0xff64c6cf),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(21.0, 14.83),
            child:
                // Adobe XD layer: 'Bars/Apple iOS UI/B…' (component)
                XDBarsAppleiOSUIBarsStatusBariPhoneXSOnLight(),
          ),
        ],
      ),
    );
  }
}
