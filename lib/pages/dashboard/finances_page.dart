import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search_widget/search_widget.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/constants.dart';
import 'package:serveit/pages/auth/signin_page.dart';
import 'package:serveit/pages/auth/signup_page.dart';

class FinancesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              'What services are you looking for?',
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
                'Recents',
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
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
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
                                          backgroundColor:
                                              Constants.accentColor,
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
                                            backgroundColor:
                                                Constants.accentColor,
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
                                              text:
                                                  'The best anshuman singh is actually',
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

