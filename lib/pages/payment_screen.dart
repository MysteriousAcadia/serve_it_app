import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:serveit/services/paymentService.dart';

class PayPage extends StatefulWidget {
  PayPage({Key key}) : super(key: key);

  @override
  PayPageState createState() => PayPageState();
}

class PayPageState extends State<PayPage> {
  onItemPress(BuildContext context, int index) async {
    switch (index) {
      case 0:
        payViaNewCard(context);
        break;
      case 1:
        payViaNewCard(context);
        break;
      case 2:
        payViaNewCard(context);
        break;
    }
  }

  payViaNewCard(BuildContext context) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Please wait...');
    await dialog.show();
    var response = await StripeService.payWithNewCard(
      amount: '15000',
      currency: 'USD',
      description: 'Some description here',
    );
    await dialog.hide();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(response.message),
      duration:
          new Duration(milliseconds: response.success == true ? 1200 : 3000),
    ));
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay \$15'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              Icon icon;
              Text text;

              switch (index) {
                case 0:
                  icon = Icon(Icons.add_circle, color: theme.primaryColor);
                  text = Text('Pay via credit card');
                  break;
                case 1:
                  icon = Icon(Icons.payment, color: theme.primaryColor);
                  text = Text('Pay via Google Pay');
                  break;
                case 2:
                  icon = Icon(Icons.payment, color: theme.primaryColor);
                  text = Text('Pay via Apple Pay');
                  break;
              }

              return InkWell(
                onTap: () {
                  onItemPress(context, index);
                },
                child: ListTile(
                  title: text,
                  leading: icon,
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  color: theme.primaryColor,
                ),
            itemCount: 3),
      ),
    );
  }
}
