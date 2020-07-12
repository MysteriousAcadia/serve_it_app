import 'package:flutter/material.dart';
import './XDBarsAppleiOSUIBarsStatusBariPhoneXSOnLight.dart';

class XDLoginSelection extends StatelessWidget {
  XDLoginSelection({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(21.0, 14.83),
            child:
                // Adobe XD layer: 'Bars/Apple iOS UI/B…' (component)
                XDBarsAppleiOSUIBarsStatusBariPhoneXSOnLight(),
          ),
          Transform.translate(
            offset: Offset(8.0, 113.0),
            child: SizedBox(
              width: 360.0,
              child: Text(
                'How do you identify \nyourself?',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 29,
                  color: const Color(0xff000000),
                  letterSpacing: -0.7250000000000001,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(4.0, 29.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(80.0, 234.0),
                  child: Container(
                    width: 208.0,
                    height: 208.0,
                    decoration: BoxDecoration(
                      color: const Color(0xfff1edee),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(130.0, 321.0),
                  child: SizedBox(
                    width: 108.0,
                    child: Text(
                      'Vector',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 29,
                        color: const Color(0xff000000),
                        letterSpacing: -0.7250000000000001,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 49.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(38.0, 502.0),
                  child: Container(
                    width: 300.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xff64c6cf),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(73.0, 517.0),
                  child: SizedBox(
                    width: 230.0,
                    child: Text(
                      'Apartment Owner',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 21,
                        color: const Color(0xffffffff),
                        letterSpacing: -0.525,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 82.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(38.0, 549.0),
                  child: Container(
                    width: 300.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xff64c6cf),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(145.0, 564.0),
                  child: SizedBox(
                    width: 86.0,
                    child: Text(
                      'Tenant',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 21,
                        color: const Color(0xffffffff),
                        letterSpacing: -0.525,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
