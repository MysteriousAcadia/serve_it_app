import 'package:flutter/material.dart';
import 'package:serveit/models/service.dart';
import 'package:serveit/utils/constants.dart';

class ServicesSearchCard extends StatelessWidget {
  final Service service;
  Color backgroundColor = Constants.cardColors[0];
  ServicesSearchCard(this.service, this.backgroundColor);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Container(
        width: double.infinity,
        height: 50,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: backgroundColor,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              service.name,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 21,
                color: const Color(0xff005c7e),
                letterSpacing: -0.4,
                fontWeight: FontWeight.w700,
                height: 1.125,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
