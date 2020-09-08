import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ServicesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.pink,
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
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
                    Text.rich(
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
                  ],
                ),
                flex: 3,
              ),
              Flexible(
                flex: 2,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text("Subscribe"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
