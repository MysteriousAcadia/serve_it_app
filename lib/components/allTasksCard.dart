import 'package:flutter/material.dart';
import 'package:serveit/utils/constants.dart';

class AllTasksCard extends StatelessWidget {
  Color backgroundColor = Constants.cardColors[0];
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: backgroundColor,
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Nathan James',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF005C7E),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Floor Cleaning',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30,
                    ),
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.call,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.message,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    '\$50',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      color: Color(0xFF005C7E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
