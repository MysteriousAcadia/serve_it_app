import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class RecentsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.pink,
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 0, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Housekeeping Housekeeping Housekeeping',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              backgroundColor: Constants.accentColor,
                              fontFamily: 'Montserrat',
                              fontSize: 21,
                              color: const Color(0xff005c7e),
                              letterSpacing: -0.4,
                              fontWeight: FontWeight.w700,
                              height: 1.125,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(
                                backgroundColor: Constants.accentColor,
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                color: const Color(0xff005c7e),
                                height: 1.3636363636363635,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Accepted by\n',
                                ),
                                TextSpan(
                                  text: 'The best anshuman singh is actually',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "1-2PM",
                        ),
                        Icon(Icons.album, size: 60),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.elliptical(27.5, 27.5),
                    ),
                  ),
                  color: const Color(0xffffffff),
                  child: Text("WOOOW"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
