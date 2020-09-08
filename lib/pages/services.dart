import 'package:dropdown_search/dropdown_search.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search_widget/search_widget.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/components/recents_card.dart';
import 'package:serveit/components/services_card.dart';
import 'package:serveit/constants.dart';

class ServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _pickDate() async {
      DateTime date = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDate: DateTime.now(),
      );
    }

    Widget optionsCard = Container(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: const Color(0xff9eeecb),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 0, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Select options',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  color: const Color(0xff005c7e),
                  letterSpacing: -0.42500000000000004,
                  fontWeight: FontWeight.w700,
                  height: 1.1764705882352942,
                ),
                textAlign: TextAlign.left,
              ),
              Column(
                children: <Widget>[
                  row(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    Widget onDemandCard = Container(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: const Color(0xff9eeecb),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 0, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'On Demand',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  color: const Color(0xff005c7e),
                  letterSpacing: -0.42500000000000004,
                  fontWeight: FontWeight.w700,
                  height: 1.1764705882352942,
                ),
                textAlign: TextAlign.left,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Button(
                      "Book Now",
                      Constants.white,
                      Constants.buttonTextStyle,
                      () => {},
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Button(
                      "Pay 150",
                      Constants.white,
                      Constants.buttonTextStyle,
                      () => {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

    Widget scheduleCard = Container(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: const Color(0xff9eeecb),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 0, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ExpandablePanel(
                header: Text(
                  'Schedule',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: const Color(0xff005c7e),
                    letterSpacing: -0.42500000000000004,
                    fontWeight: FontWeight.w700,
                    height: 1.1764705882352942,
                  ),
                  textAlign: TextAlign.left,
                ),
                collapsed: Container(),
                expanded: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("Date Widget soon"),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      onTap: _pickDate,
                    ),
                  ],
                ),
                tapHeaderToExpand: true,
                hasIcon: true,
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'Huge Service Heading',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  color: const Color(0xff606060),
                  letterSpacing: -0.675,
                  fontWeight: FontWeight.w700,
                  height: 1.1851851851851851,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            optionsCard,
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'How do you want the service?',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  color: const Color(0xff606060),
                  letterSpacing: -0.675,
                  fontWeight: FontWeight.w700,
                  height: 1.1851851851851851,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            scheduleCard,
          ],
        ),
      ),
    );
  }

  Widget row() {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Wrap(
        children: <Widget>[
          chipForRow("TEST1", Colors.blue),
          chipForRow("TEST1", Colors.blue),
          chipForRow("TEST1", Colors.blue),
          chipForRow("TEST1", Colors.blue),
          chipForRow("TEST1", Colors.blue),
          chipForRow("TEST1", Colors.blue),
          chipForRow("TEST1", Colors.blue),
          chipForRow("TEST1", Colors.blue),
        ],
      ),
    );
  }

  Widget chipForRow(String label, Color color) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ChoiceChip(
        label: Text(label),
        labelPadding: EdgeInsets.all(5.0),
        backgroundColor: color,
        padding: EdgeInsets.all(5.0),
      ),
    );
  }
}
