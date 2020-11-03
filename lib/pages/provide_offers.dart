import 'package:flutter/material.dart';
import 'package:serveit/components/services_card/accept_offer.dart';

class ProvideOffers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 50,
        ),
        child: ListView(
          children: <Widget>[
            AcceptServicesCard(),
            AcceptServicesCard(),
          ],
        ),
      ),
    );
  }
}
