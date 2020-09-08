import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search_widget/search_widget.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/components/recents_card.dart';
import 'package:serveit/components/services_card.dart';
import 'package:serveit/constants.dart';
import 'package:serveit/pages/auth/signin_page.dart';
import 'package:serveit/pages/auth/signup_page.dart';

class DeliverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              'What services are you providing?',
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
          SearchWidget<String>(
            dataList: ["A", "B", "BC", "CD"],
            hideSearchBoxWhenItemSelected: false,
            listContainerHeight: MediaQuery.of(context).size.height / 4,
            queryBuilder: (String query, List<dynamic> list) {
              return list
                  .where((dynamic item) =>
                      item.toLowerCase().contains(query.toLowerCase()))
                  .toList();
            },
            popupListItemBuilder: (dynamic item) {
              return Text(item);
            },
            selectedItemBuilder:
                (dynamic selectedItem, VoidCallback deleteSelectedItem) {
              return Text(selectedItem);
            },
            // widget customization
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
              child: Text(
                'Scheduled',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 27,
                  color: const Color(0xff606060),
                  letterSpacing: -0.525,
                  fontWeight: FontWeight.w700,
                  height: 1.1904761904761905,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            height: 205,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
               RecentsCard(Constants.cardColors[0]),
RecentsCard(Constants.cardColors[1]),
RecentsCard(Constants.cardColors[2]),
               
               
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
              child: Text(
                'Offers',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 27,
                  color: const Color(0xff606060),
                  letterSpacing: -0.525,
                  fontWeight: FontWeight.w700,
                  height: 1.1904761904761905,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            height: 205,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                RecentsCard(Constants.cardColors[0]),
                RecentsCard(Constants.cardColors[1]),
                RecentsCard(Constants.cardColors[2]),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
              child: Text(
                'Offer other services',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 27,
                  color: const Color(0xff606060),
                  letterSpacing: -0.525,
                  fontWeight: FontWeight.w700,
                  height: 1.1904761904761905,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          ServicesCard(Constants.cardColors[0]),
          ServicesCard(Constants.cardColors[1]),
          ServicesCard(Constants.cardColors[2]),
        ],
      ),
    );
  }
}
