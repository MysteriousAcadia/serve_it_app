import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: ListView(
          children: <Widget>[
            Card(
              margin: EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 25,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Pay via Google Pay',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 25,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Pay via Apple Pay',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CreditCardWidget(
              cardNumber: '4265656626161616161',
              expiryDate: '10/24',
              cardHolderName: 'ter Stegan',
              cvvCode: '100',
              showBackView: false,
              height: 175,
              textStyle: TextStyle(color: Colors.yellowAccent),
              width: MediaQuery.of(context).size.width,
              animationDuration: Duration(milliseconds: 1000),
            ),
            SizedBox(
              height: 30,
            ),
            CreditCardForm(
              themeColor: Colors.green,
              onCreditCardModelChange: (CreditCardModel data) {
                print(data);
              },
            ),
            Container(
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.symmetric(horizontal: 100),
              child: RaisedButton(
                onPressed: () {},
                child: Text('SUBMIT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
