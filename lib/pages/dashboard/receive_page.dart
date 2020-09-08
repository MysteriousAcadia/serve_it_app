import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search_widget/search_widget.dart';
import 'package:serveit/components/recents_card.dart';
import 'package:serveit/components/services_card.dart';
import 'package:serveit/constants.dart';

class ReceivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
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
                RecentsCard(),
                RecentsCard(),
                RecentsCard(),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
              child: Text(
                'Explore other services',
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
          ServicesCard(),
          ServicesCard(),

        ],
      ),
    );
  }
}

class ReceivePageNew extends StatelessWidget {
  ReceivePageNew({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          // Transform.translate(
          //   offset: Offset(21.0, 14.83),
          //   child:
          //       // Adobe XD layer: 'Bars/Apple iOS UI/B…' (component)
          //       XDBarsAppleiOSUIBarsStatusBariPhoneXSOnLight(),
          // ),
          Transform.translate(
            offset: Offset(16.0, 243.17),
            child: SizedBox(
              width: 102.0,
              child: Text(
                'Recents',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 21,
                  color: const Color(0xff606060),
                  letterSpacing: -0.525,
                  fontWeight: FontWeight.w700,
                  height: 1.1904761904761905,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 62.33),
            child: SizedBox(
              width: 294.0,
              height: 72.0,
              child: Text(
                'What services are you looking for?',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 27,
                  color: const Color(0xff606060),
                  letterSpacing: -0.675,
                  fontWeight: FontWeight.w700,
                  height: 1.1851851851851851,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-1.0, -354.0),
            child:
                // Adobe XD layer: 'Primary Location' (group)
                Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(38.0, 508.28),
                  child: SvgPicture.string(
                    _svg_zdc03m,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
                Transform.translate(
                  offset: Offset(67.0, 521.0),
                  child: Text(
                    'Quick Search',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: const Color(0xff9bdce7),
                      letterSpacing: -0.4,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(305.27, 521.0),
                  child:
                      // Adobe XD layer: 'Search' (group)
                      Stack(
                    children: <Widget>[
                      // Adobe XD layer: 'Combined Shape' (shape)
                      SvgPicture.string(
                        _svg_xjlp0i,
                        allowDrawingOutsideViewBox: true,
                      ),
                      // Adobe XD layer: 'Search' (group)
                      Stack(
                        children: <Widget>[
                          Transform.translate(
                            offset: Offset(-4.03, -4.0),
                            child:
                                // Adobe XD layer: 'color/5-grey' (component)
                                Container(),
                          ),
                          // Adobe XD layer: 'Combined Shape' (shape)
                          SvgPicture.string(
                            _svg_xjlp0i,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(21.0, 286.0),
                child: Container(
                  width: 244.0,
                  height: 146.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: const Color(0xffffeedf),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x14000000),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(32.0, 300.0),
                child: SizedBox(
                  width: 140.0,
                  child: Text(
                    'Housekeeping',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: const Color(0xff005c7e),
                      letterSpacing: -0.4,
                      fontWeight: FontWeight.w700,
                      height: 1.125,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(41.0, 341.5),
                child:
                    // Adobe XD layer: 'sign up' (text)
                    Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 11,
                      color: const Color(0xff005c7e),
                      height: 1.3636363636363635,
                    ),
                    children: [
                      TextSpan(
                        text: 'Accepted by\n',
                      ),
                      TextSpan(
                        text: 'Peter H.',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(44.64, 321.94),
                child: SvgPicture.string(
                  _svg_rlc9hq,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
              Transform.translate(
                offset: Offset(189.0, 325.0),
                child: Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(27.5, 27.5)),
                    color: const Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x29000000),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(193.0, 328.0),
                child: Container(
                  width: 48.0,
                  height: 47.0,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(24.0, 23.5)),
                    image: DecorationImage(
                      image: const AssetImage(''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(199.0, 299.33),
                child: Text(
                  '12PM-1PM',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 8,
                    color: const Color(0xff005c7e),
                    fontWeight: FontWeight.w700,
                    height: 1.75,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(-32.0, -246.9),
                child: Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(114.0, 638.0),
                      child: Stack(
                        children: <Widget>[
                          Transform.translate(
                            offset: Offset(0.0, -0.1),
                            child: Container(
                              width: 122.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0.0, -0.1),
                            child: Container(
                              width: 46.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xffffd8b9),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(54.0, 5.9),
                            child: Text(
                              'Book now',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 10,
                                color: const Color(0xff005c7e),
                                letterSpacing: -0.25,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(127.54, 642.78),
                      child: Stack(
                        children: <Widget>[
                          Transform.translate(
                            offset: Offset(5.46, -0.05),
                            child: Text(
                              'Total',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 4,
                                color: const Color(0xff005c7e),
                                letterSpacing: -0.1,
                                height: 1.25,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0.46, 4.62),
                            child: Text(
                              '\$150',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 8,
                                color: const Color(0xff005c7e),
                                letterSpacing: -0.2,
                                fontWeight: FontWeight.w700,
                                height: 1.125,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(24.0, 503.0),
            child: Container(
              width: 331.0,
              height: 136.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xffdcf3e9),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x14000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(1.0, 461.17),
            child: SizedBox(
              width: 280.0,
              child: Text(
                'Explore other services',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 21,
                  color: const Color(0xff606060),
                  letterSpacing: -0.525,
                  fontWeight: FontWeight.w700,
                  height: 1.1904761904761905,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(46.0, 539.17),
            child: Text(
              'Shopping',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: const Color(0xff005c7e),
                letterSpacing: -0.4,
                fontWeight: FontWeight.w700,
                height: 1.1875,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(48.66, 573.0),
            child:
                // Adobe XD layer: 'sign up' (text)
                Text(
              'Get the best services\nat your doorstep',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13,
                color: const Color(0xff005c7e),
                height: 1.3846153846153846,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 662.0),
            child: Container(
              width: 331.0,
              height: 136.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xffe8ebfe),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x14000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(46.0, 698.17),
            child: Text(
              'Pet Sitting',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: const Color(0xff005c7e),
                letterSpacing: -0.4,
                fontWeight: FontWeight.w700,
                height: 1.1875,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(46.5, 732.0),
            child:
                // Adobe XD layer: 'sign up' (text)
                Text(
              'Get the best services\nat your doorstep',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13,
                color: const Color(0xff005c7e),
                height: 1.3846153846153846,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 821.0),
            child: Container(
              width: 331.0,
              height: 136.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xfff9e8e9),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x14000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(46.0, 857.17),
            child: Text(
              'Baby Sitting',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: const Color(0xff005c7e),
                letterSpacing: -0.4,
                fontWeight: FontWeight.w700,
                height: 1.1875,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(46.5, 891.0),
            child:
                // Adobe XD layer: 'sign up' (text)
                Text(
              'Get the best services\nat your doorstep',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13,
                color: const Color(0xff005c7e),
                height: 1.3846153846153846,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 980.0),
            child: Container(
              width: 331.0,
              height: 136.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xffe8d8eb),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x14000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(46.0, 1016.17),
            child: Text(
              'Care Giving',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: const Color(0xff005c7e),
                letterSpacing: -0.4,
                fontWeight: FontWeight.w700,
                height: 1.1875,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(46.5, 1050.0),
            child:
                // Adobe XD layer: 'sign up' (text)
                Text(
              'Get the best services\nat your doorstep',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13,
                color: const Color(0xff005c7e),
                height: 1.3846153846153846,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 1139.0),
            child: Container(
              width: 331.0,
              height: 136.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xffdde5f2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x14000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(46.0, 1175.17),
            child: Text(
              'Cooking Service',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: const Color(0xff005c7e),
                letterSpacing: -0.4,
                fontWeight: FontWeight.w700,
                height: 1.1875,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(46.5, 1209.0),
            child:
                // Adobe XD layer: 'sign up' (text)
                Text(
              'Get the best services\nat your doorstep',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13,
                color: const Color(0xff005c7e),
                height: 1.3846153846153846,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 1298.0),
            child: Container(
              width: 331.0,
              height: 136.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xfff3d6e8),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x14000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(46.0, 1334.17),
            child: Text(
              'Hair Service',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: const Color(0xff005c7e),
                letterSpacing: -0.4,
                fontWeight: FontWeight.w700,
                height: 1.1875,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(46.5, 1368.0),
            child:
                // Adobe XD layer: 'sign up' (text)
                Text(
              'Get the best services\nat your doorstep',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13,
                color: const Color(0xff005c7e),
                height: 1.3846153846153846,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 1457.0),
            child: SvgPicture.string(
              _svg_mznw4t,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(46.0, 1493.17),
            child: Text(
              'Handyman \nService',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: const Color(0xff005c7e),
                letterSpacing: -0.4,
                fontWeight: FontWeight.w700,
                height: 1.1875,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(46.5, 1532.0),
            child:
                // Adobe XD layer: 'sign up' (text)
                Text(
              'Get the best services\nat your doorstep',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13,
                color: const Color(0xff005c7e),
                height: 1.3846153846153846,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 1616.0),
            child: Container(
              width: 331.0,
              height: 136.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xfff9edda),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x14000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(46.0, 1652.17),
            child: Text(
              'Moving In/Out',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: const Color(0xff005c7e),
                letterSpacing: -0.4,
                fontWeight: FontWeight.w700,
                height: 1.1875,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(46.5, 1686.0),
            child:
                // Adobe XD layer: 'sign up' (text)
                Text(
              'Get the best services\nat your doorstep',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13,
                color: const Color(0xff005c7e),
                height: 1.3846153846153846,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(-1.0, -150.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(234.0, 654.23),
                  child:
                      // Adobe XD layer: 'Symbols' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(-12.0, -1.0),
                        child:
                            // Adobe XD layer: 'Scene/Plants' (group)
                            Stack(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(0.0, 0.0),
                              child:
                                  // Adobe XD layer: 'Leaf-Bottom' (shape)
                                  SvgPicture.string(
                                _svg_j6fe41,
                                allowDrawingOutsideViewBox: true,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(26.64, 15.36),
                              child:
                                  // Adobe XD layer: 'Plant-Right' (group)
                                  Stack(
                                children: <Widget>[
                                  Transform.translate(
                                    offset: Offset(0.0, 0.0),
                                    child:
                                        // Adobe XD layer: 'Leaf-Me-Alone!' (shape)
                                        SvgPicture.string(
                                      _svg_tax2sh,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(222.0, 712.0),
                  child: Container(
                    width: 124.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(225.98, 714.78),
                  child:
                      // Adobe XD layer: 'Icon feather-plus-c…' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(3.0, 3.0),
                        child: SvgPicture.string(
                          _svg_z2g9dv,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(261.0, 719.5),
                  child: Text(
                    'Subscribe',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13,
                      color: const Color(0xff005c7e),
                      letterSpacing: -0.325,
                      fontWeight: FontWeight.w700,
                      height: 1.1538461538461537,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(-1.0, 9.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(234.0, 654.23),
                  child:
                      // Adobe XD layer: 'Symbols' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(-12.0, -1.0),
                        child:
                            // Adobe XD layer: 'Scene/Plants' (group)
                            Stack(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(0.0, 0.0),
                              child:
                                  // Adobe XD layer: 'Leaf-Bottom' (shape)
                                  SvgPicture.string(
                                _svg_j6fe41,
                                allowDrawingOutsideViewBox: true,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(26.64, 15.36),
                              child:
                                  // Adobe XD layer: 'Plant-Right' (group)
                                  Stack(
                                children: <Widget>[
                                  Transform.translate(
                                    offset: Offset(0.0, 0.0),
                                    child:
                                        // Adobe XD layer: 'Leaf-Me-Alone!' (shape)
                                        SvgPicture.string(
                                      _svg_tax2sh,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(222.0, 712.0),
                  child: Container(
                    width: 124.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(225.98, 714.78),
                  child:
                      // Adobe XD layer: 'Icon feather-plus-c…' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(3.0, 3.0),
                        child: SvgPicture.string(
                          _svg_z2g9dv,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(261.0, 719.5),
                  child: Text(
                    'Subscribe',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13,
                      color: const Color(0xff005c7e),
                      letterSpacing: -0.325,
                      fontWeight: FontWeight.w700,
                      height: 1.1538461538461537,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(-1.0, 168.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(234.0, 654.23),
                  child:
                      // Adobe XD layer: 'Symbols' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(-12.0, -1.0),
                        child:
                            // Adobe XD layer: 'Scene/Plants' (group)
                            Stack(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(0.0, 0.0),
                              child:
                                  // Adobe XD layer: 'Leaf-Bottom' (shape)
                                  SvgPicture.string(
                                _svg_j6fe41,
                                allowDrawingOutsideViewBox: true,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(26.64, 15.36),
                              child:
                                  // Adobe XD layer: 'Plant-Right' (group)
                                  Stack(
                                children: <Widget>[
                                  Transform.translate(
                                    offset: Offset(0.0, 0.0),
                                    child:
                                        // Adobe XD layer: 'Leaf-Me-Alone!' (shape)
                                        SvgPicture.string(
                                      _svg_tax2sh,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(222.0, 712.0),
                  child: Container(
                    width: 124.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(225.98, 714.78),
                  child:
                      // Adobe XD layer: 'Icon feather-plus-c…' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(3.0, 3.0),
                        child: SvgPicture.string(
                          _svg_z2g9dv,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(261.0, 719.5),
                  child: Text(
                    'Subscribe',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13,
                      color: const Color(0xff005c7e),
                      letterSpacing: -0.325,
                      fontWeight: FontWeight.w700,
                      height: 1.1538461538461537,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(-1.0, 327.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(234.0, 654.23),
                  child:
                      // Adobe XD layer: 'Symbols' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(-12.0, -1.0),
                        child:
                            // Adobe XD layer: 'Scene/Plants' (group)
                            Stack(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(0.0, 0.0),
                              child:
                                  // Adobe XD layer: 'Leaf-Bottom' (shape)
                                  SvgPicture.string(
                                _svg_j6fe41,
                                allowDrawingOutsideViewBox: true,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(26.64, 15.36),
                              child:
                                  // Adobe XD layer: 'Plant-Right' (group)
                                  Stack(
                                children: <Widget>[
                                  Transform.translate(
                                    offset: Offset(0.0, 0.0),
                                    child:
                                        // Adobe XD layer: 'Leaf-Me-Alone!' (shape)
                                        SvgPicture.string(
                                      _svg_tax2sh,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(222.0, 712.0),
                  child: Container(
                    width: 124.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(225.98, 714.78),
                  child:
                      // Adobe XD layer: 'Icon feather-plus-c…' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(3.0, 3.0),
                        child: SvgPicture.string(
                          _svg_z2g9dv,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(261.0, 719.5),
                  child: Text(
                    'Subscribe',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13,
                      color: const Color(0xff005c7e),
                      letterSpacing: -0.325,
                      fontWeight: FontWeight.w700,
                      height: 1.1538461538461537,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(-1.0, 486.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(234.0, 654.23),
                  child:
                      // Adobe XD layer: 'Symbols' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(-12.0, -1.0),
                        child:
                            // Adobe XD layer: 'Scene/Plants' (group)
                            Stack(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(0.0, 0.0),
                              child:
                                  // Adobe XD layer: 'Leaf-Bottom' (shape)
                                  SvgPicture.string(
                                _svg_j6fe41,
                                allowDrawingOutsideViewBox: true,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(26.64, 15.36),
                              child:
                                  // Adobe XD layer: 'Plant-Right' (group)
                                  Stack(
                                children: <Widget>[
                                  Transform.translate(
                                    offset: Offset(0.0, 0.0),
                                    child:
                                        // Adobe XD layer: 'Leaf-Me-Alone!' (shape)
                                        SvgPicture.string(
                                      _svg_tax2sh,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(222.0, 712.0),
                  child: Container(
                    width: 124.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(225.98, 714.78),
                  child:
                      // Adobe XD layer: 'Icon feather-plus-c…' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(3.0, 3.0),
                        child: SvgPicture.string(
                          _svg_z2g9dv,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(261.0, 719.5),
                  child: Text(
                    'Subscribe',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13,
                      color: const Color(0xff005c7e),
                      letterSpacing: -0.325,
                      fontWeight: FontWeight.w700,
                      height: 1.1538461538461537,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(-1.0, 648.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(234.0, 654.23),
                  child:
                      // Adobe XD layer: 'Symbols' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(-12.0, -1.0),
                        child:
                            // Adobe XD layer: 'Scene/Plants' (group)
                            Stack(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(0.0, 0.0),
                              child:
                                  // Adobe XD layer: 'Leaf-Bottom' (shape)
                                  SvgPicture.string(
                                _svg_j6fe41,
                                allowDrawingOutsideViewBox: true,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(26.64, 15.36),
                              child:
                                  // Adobe XD layer: 'Plant-Right' (group)
                                  Stack(
                                children: <Widget>[
                                  Transform.translate(
                                    offset: Offset(0.0, 0.0),
                                    child:
                                        // Adobe XD layer: 'Leaf-Me-Alone!' (shape)
                                        SvgPicture.string(
                                      _svg_tax2sh,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(222.0, 712.0),
                  child: Container(
                    width: 124.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(225.98, 714.78),
                  child:
                      // Adobe XD layer: 'Icon feather-plus-c…' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(3.0, 3.0),
                        child: SvgPicture.string(
                          _svg_z2g9dv,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(261.0, 719.5),
                  child: Text(
                    'Subscribe',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13,
                      color: const Color(0xff005c7e),
                      letterSpacing: -0.325,
                      fontWeight: FontWeight.w700,
                      height: 1.1538461538461537,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(-1.0, 804.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(234.0, 654.23),
                  child:
                      // Adobe XD layer: 'Symbols' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(-12.0, -1.0),
                        child:
                            // Adobe XD layer: 'Scene/Plants' (group)
                            Stack(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(0.0, 0.0),
                              child:
                                  // Adobe XD layer: 'Leaf-Bottom' (shape)
                                  SvgPicture.string(
                                _svg_j6fe41,
                                allowDrawingOutsideViewBox: true,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(26.64, 15.36),
                              child:
                                  // Adobe XD layer: 'Plant-Right' (group)
                                  Stack(
                                children: <Widget>[
                                  Transform.translate(
                                    offset: Offset(0.0, 0.0),
                                    child:
                                        // Adobe XD layer: 'Leaf-Me-Alone!' (shape)
                                        SvgPicture.string(
                                      _svg_tax2sh,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(222.0, 712.0),
                  child: Container(
                    width: 124.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(225.98, 714.78),
                  child:
                      // Adobe XD layer: 'Icon feather-plus-c…' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(3.0, 3.0),
                        child: SvgPicture.string(
                          _svg_z2g9dv,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(261.0, 719.5),
                  child: Text(
                    'Subscribe',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13,
                      color: const Color(0xff005c7e),
                      letterSpacing: -0.325,
                      fontWeight: FontWeight.w700,
                      height: 1.1538461538461537,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(-1.0, 960.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(234.0, 654.23),
                  child:
                      // Adobe XD layer: 'Symbols' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(-12.0, -1.0),
                        child:
                            // Adobe XD layer: 'Scene/Plants' (group)
                            Stack(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(0.0, 0.0),
                              child:
                                  // Adobe XD layer: 'Leaf-Bottom' (shape)
                                  SvgPicture.string(
                                _svg_j6fe41,
                                allowDrawingOutsideViewBox: true,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(26.64, 15.36),
                              child:
                                  // Adobe XD layer: 'Plant-Right' (group)
                                  Stack(
                                children: <Widget>[
                                  Transform.translate(
                                    offset: Offset(0.0, 0.0),
                                    child:
                                        // Adobe XD layer: 'Leaf-Me-Alone!' (shape)
                                        SvgPicture.string(
                                      _svg_tax2sh,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(222.0, 712.0),
                  child: Container(
                    width: 124.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(225.98, 714.78),
                  child:
                      // Adobe XD layer: 'Icon feather-plus-c…' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(3.0, 3.0),
                        child: SvgPicture.string(
                          _svg_z2g9dv,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(261.0, 719.5),
                  child: Text(
                    'Subscribe',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13,
                      color: const Color(0xff005c7e),
                      letterSpacing: -0.325,
                      fontWeight: FontWeight.w700,
                      height: 1.1538461538461537,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          // Transform.translate(
          //   offset: Offset(0.5, 734.17),
          //   child:
          //       // Adobe XD layer: 'Menu_Bottom' (component)
          //       XDMenu_Bottom(),
          // ),
          Transform.translate(
            offset: Offset(263.0, 2.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(21.0, 286.0),
                  child: Container(
                    width: 244.0,
                    height: 146.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xffdcf3e9),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x14000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(32.0, 300.0),
                  child: SizedBox(
                    width: 140.0,
                    child: Text(
                      'Housekeeping',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        color: const Color(0xff005c7e),
                        letterSpacing: -0.4,
                        fontWeight: FontWeight.w700,
                        height: 1.125,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(197.0, 398.83),
                  child: SizedBox(
                    width: 48.0,
                    child: Text(
                      'Booked',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10,
                        color: const Color(0xff005c7e),
                        letterSpacing: -0.25,
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(41.0, 341.5),
                  child:
                      // Adobe XD layer: 'sign up' (text)
                      Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 11,
                        color: const Color(0xff005c7e),
                        height: 1.3636363636363635,
                      ),
                      children: [
                        TextSpan(
                          text: 'Accepted by\n',
                        ),
                        TextSpan(
                          text: 'Peter H.',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(44.64, 321.94),
                  child: SvgPicture.string(
                    _svg_rlc9hq,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
                Transform.translate(
                  offset: Offset(189.0, 325.0),
                  child: Container(
                    width: 55.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(27.5, 27.5)),
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(193.0, 328.0),
                  child: Container(
                    width: 48.0,
                    height: 47.0,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(24.0, 23.5)),
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(199.0, 299.33),
                  child: Text(
                    '12PM-1PM',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 8,
                      color: const Color(0xff005c7e),
                      fontWeight: FontWeight.w700,
                      height: 1.75,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(41.0, 391.0),
                  child: Container(
                    width: 104.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(41.0, 391.0),
                  child: Container(
                    width: 46.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xffb9fbfd),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(95.0, 397.0),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 10,
                      color: const Color(0xff005c7e),
                      letterSpacing: -0.25,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(56.0, 395.83),
                  child: Text(
                    'Charges',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 4,
                      color: const Color(0xff005c7e),
                      letterSpacing: -0.1,
                      height: 1.25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(57.0, 400.5),
                  child: Text(
                    '-\$15',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 8,
                      color: const Color(0xff005c7e),
                      letterSpacing: -0.2,
                      fontWeight: FontWeight.w700,
                      height: 1.125,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(215.02, 389.01),
                  child:
                      // Adobe XD layer: 'Icon ionic-md-done-…' (shape)
                      SvgPicture.string(
                    _svg_xm7ra,
                    allowDrawingOutsideViewBox: true,
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

const String _svg_zdc03m =
    '<svg viewBox="38.0 508.3 302.0 42.4" ><path transform="translate(38.0, 508.28)" d="M 10.06666660308838 0 L 291.9333190917969 0 C 297.4930114746094 0 302 3.454848051071167 302 7.71661901473999 L 302 34.72478866577148 C 302 38.98655700683594 297.4930114746094 42.44140625 291.9333190917969 42.44140625 L 10.06666660308838 42.44140625 C 4.506999969482422 42.44140625 0 38.98655700683594 0 34.72478866577148 L 0 7.71661901473999 C 0 3.454848051071167 4.506999969482422 0 10.06666660308838 0 Z" fill="none" stroke="#9bdce7" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xjlp0i =
    '<svg viewBox="0.0 0.0 16.5 16.4" ><path  d="M 11.27242279052734 12.60267639160156 C 10.04610061645508 13.51724720001221 8.584362983703613 14.00040054321289 7.046868324279785 14.00040054321289 C 3.161033868789673 14.00040054321289 0 10.86030006408691 0 7.000200271606445 C 0 3.140100002288818 3.161033868789673 0 7.046868324279785 0 C 10.93270206451416 0 14.09373664855957 3.140100002288818 14.09373664855957 7.000200271606445 C 14.09373664855957 8.51669979095459 13.61264991760254 9.961200714111328 12.70302581787109 11.1761999130249 L 15.81604290008545 14.29020023345947 C 15.85165786743164 14.32558059692383 15.88424015045166 14.36314964294434 15.91370582580566 14.40264987945557 L 16.5290641784668 15.01740074157715 L 15.10483264923096 16.43130111694336 L 11.27242279052734 12.60267639160156 Z M 2.013132095336914 7.000200271606445 C 2.013132095336914 9.756899833679199 4.270884037017822 11.99970054626465 7.046868324279785 11.99970054626465 C 9.821946144104004 11.99970054626465 12.07969856262207 9.756899833679199 12.07969856262207 7.000200271606445 C 12.07969856262207 4.242599964141846 9.821946144104004 1.999800086021423 7.046868324279785 1.999800086021423 C 4.270884037017822 1.999800086021423 2.013132095336914 4.242599964141846 2.013132095336914 7.000200271606445 Z" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_rlc9hq =
    '<svg viewBox="44.6 321.9 25.1 1.0" ><path transform="translate(-133.36, -1641.94)" d="M 178 1963.87890625 L 203.0849914550781 1963.87890625" fill="none" stroke="#005c7e" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_mznw4t =
    '<svg viewBox="24.0 1457.0 331.0 136.0" ><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="6"/></filter></defs><path transform="translate(24.0, 1457.0)" d="M 5.479549407958984 0 L 325.4852294921875 0 C 328.511474609375 0 330.9647827148438 2.238576173782349 330.9647827148438 5 L 330.9647827148438 131 C 330.9647827148438 133.7614288330078 328.511474609375 136 325.4852294921875 136 L 5.479549407958984 136 C 2.453277587890625 136 0 133.7614288330078 0 131 L 0 5 C 0 2.238576173782349 2.453277587890625 0 5.479549407958984 0 Z" fill="#dfe9eb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
const String _svg_tax2sh =
    '<svg viewBox="0.0 0.0 75.4 117.4" ><path transform="matrix(-0.994522, 0.10453, -0.10453, -0.994522, 34.66, 100.84)" d="M 19.60989952087402 69.453369140625 C 15.60853576660156 69.24144744873047 10.93101978302002 66.40129852294922 10.96109199523926 62.03086853027344 C 10.98304557800293 58.85540771484375 11.40795421600342 55.73124313354492 11.26052379608154 52.54258728027344 C 11.14246368408203 49.99436569213867 10.58835411071777 47.5018310546875 9.727574348449707 45.1013298034668 C 8.899884223937988 42.79286193847656 6.900522708892822 40.69191360473633 6.576089382171631 38.28496551513672 C 6.36927604675293 36.75115966796875 6.794127941131592 34.66867828369141 7.449883460998535 33.25856399536133 C 8.247323989868164 31.54421234130859 7.908089160919189 31.65061187744141 6.848498344421387 30.03034782409668 C 4.772196769714355 26.85518455505371 2.941016435623169 23.63047790527344 1.790329813957214 19.97785186767578 C 0.1327827423810959 14.71697425842285 -0.6825079917907715 8.685235977172852 0.70778888463974 3.263154029846191 C 0.884558379650116 2.574657678604126 1.270719289779663 0.0777360200881958 2.252169609069824 0.003577137598767877 C 3.348369359970093 -0.07936908304691315 2.694576978683472 1.303197264671326 2.588415622711182 1.76070761680603 C 1.911527037620544 4.680591583251953 1.314567446708679 7.232325553894043 1.440191149711609 10.283522605896 C 1.925068140029907 22.05564498901367 9.438899040222168 30.56789398193359 13.82003211975098 40.97622299194336 C 14.0643892288208 41.51494216918945 14.56585788726807 42.7890510559082 14.91904544830322 43.63201522827148 C 15.47664165496826 44.96298980712891 15.91849231719971 47.43060684204102 16.75430107116699 48.46173858642578 C 18.32840156555176 50.40470504760742 17.08283805847168 46.70049667358398 16.81104278564453 45.99001312255859 C 16.46741104125977 45.09106826782227 16.08603096008301 44.13380432128906 15.72058963775635 43.33920288085938 C 14.05319404602051 39.6593132019043 12.18306159973145 35.63737869262695 10.46026992797852 31.84347343444824 C 19.75281715393066 30.72968673706055 24.99745559692383 42.31158828735352 26.67897605895996 49.74053573608398 C 28.06446647644043 55.86108016967773 29.01294326782227 69.93023681640625 19.60989952087402 69.453369140625" fill="#69a1ac" fill-opacity="0.55" stroke="none" stroke-width="0.9999982714653015" stroke-opacity="0.55" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-77.31, -55.25)" d="M 138.8390197753906 78.03553771972656 C 132.1498718261719 78.5662841796875 127.8553314208984 82.98033905029297 125.8563842773438 89.154296875 C 124.7789306640625 92.48129272460938 124.6552429199219 95.89915466308594 124.0564422607422 99.3184814453125 C 123.1560211181641 104.4624176025391 121.2180328369141 108.360969543457 117.4305725097656 112.0259170532226 C 116.2575836181641 113.1608047485352 115.3929290771484 114.3261795043945 114.7785949707031 115.5730361938476 C 113.5587005615234 116.8178405761719 112.4967803955078 118.2264862060547 111.716552734375 119.9487533569336 C 110.7200164794922 122.1481857299805 110.4380340576172 124.7872848510742 111.5884704589844 126.97998046875 C 111.8979797363281 127.569694519043 112.6697235107422 128.7529602050781 113.4696044921875 129.2904968261719 C 110.4749755859375 135.6684112548828 108.8283233642578 142.6536102294922 109.0138549804688 149.6300201416016 C 109.1261291503906 153.8410034179688 109.3315887451172 158.0540618896484 109.5716247558594 162.2600708007812 C 109.6361083984375 163.3893890380859 110.0039672851562 165.2544097900391 110.5561676025391 163.3603668212891 C 111.061767578125 161.6278533935547 110.4277801513672 158.9081573486328 110.3691711425781 157.0985565185547 C 110.0836791992188 148.2817535400391 109.8398132324219 140.2651214599609 113.4690093994141 132.0277709960938 C 113.8497467041016 131.164306640625 114.2533416748047 130.307861328125 114.6733703613281 129.4584503173828 C 114.6982727050781 129.444091796875 114.7211456298828 129.4267883300781 114.7442932128906 129.4100799560547 C 114.7601165771484 129.4223937988281 114.7747802734375 129.4355926513672 114.7908935546875 129.4478912353516 C 114.8175659179688 129.3998260498047 114.8545074462891 129.3429718017578 114.8972930908203 129.2793731689453 C 115.0177612304688 129.1548004150391 115.1229858398438 128.9976959228516 115.2232208251953 128.8224182128906 C 115.5450592041016 128.3763275146484 115.9093780517578 127.8519592285156 115.9114227294922 127.5650100708008 C 115.9114227294922 127.5629577636719 115.9102478027344 127.559440612793 115.9102478027344 127.5570983886719 C 118.1568756103516 123.8895111083984 120.7303161621094 120.4241638183594 123.3588562011719 117.026237487793 C 123.3392181396484 117.0511474609375 126.2101440429688 113.1420593261719 125.7664031982422 115.3036727905273 C 125.5524291992188 116.3456497192383 123.4406280517578 118.3293609619141 122.5876922607422 119.4328918457031 C 120.7010040283203 121.8876190185547 118.4854583740234 124.9983215332031 116.6444702148438 128.0061340332031 C 116.3968048095703 128.1485748291016 116.0468444824219 128.8473358154297 115.7935943603516 129.3681640625 C 115.6537780761719 129.6319732666016 115.5233612060547 129.8977966308594 115.3952789306641 130.1296539306641 C 121.9188385009766 132.2848358154297 126.9933166503906 127.9434051513672 130.4536743164062 122.8938522338867 C 130.4577789306641 122.8876953125 130.4615936279297 122.8815383911133 130.4654083251953 122.8756637573242 C 131.5185241699219 121.4805068969726 132.5971374511719 120.0950164794922 133.9448089599609 118.9920654296875 C 136.1929016113281 117.1513977050781 138.6007385253906 116.8266296386719 141.2515563964844 115.9209518432617 C 148.4806213378906 113.4509735107422 151.5540924072266 104.0822677612305 152.5301208496094 97.13076782226562 C 153.631591796875 89.28823852539062 148.244384765625 77.26224517822266 138.8390197753906 78.03553771972656" fill="#89c5cc" fill-opacity="0.55" stroke="none" stroke-width="1" stroke-opacity="0.55" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.99027, -0.13917, 0.13917, 0.99027, 19.76, 4.16)" d="M 28.7494945526123 0.6688234210014343 C 20.95620536804199 6.789265632629395 16.29236602783203 16.14211845397949 12.39469432830811 25.00317573547363 C 8.041837692260742 34.89993667602539 4.652410984039307 45.0946044921875 3.072973012924194 55.79839706420898 C 2.035421133041382 62.83079147338867 0.8484166264533997 69.88722229003906 0.2711247205734253 76.97618865966797 C 0.06595116853713989 79.49362945556641 -0.03669218719005585 82.03013610839844 0.01193396560847759 84.55609130859375 C 0.0160075630992651 84.76360321044922 0.1263309568166733 90.40376281738281 1.154240369796753 89.23751831054688 C 1.738830804824829 88.57423400878906 1.050716042518616 83.38837432861328 1.062497138977051 82.54219055175781 C 1.12985372543335 77.77722930908203 1.655474066734314 73.04158020019531 2.347044944763184 68.32997131347656 C 3.485570430755615 60.57214736938477 4.342309951782227 52.81550216674805 6.216401100158691 45.19044876098633 C 6.496021270751953 44.05175399780273 6.759518146514893 42.85179138183594 7.192431926727295 41.76057434082031 C 7.652603149414062 40.60018157958984 7.207966327667236 41.07237243652344 8.223562240600586 40.73031997680664 C 9.210440635681152 40.39735794067383 10.34063720703125 40.62363052368164 11.37851238250732 40.17811584472656 C 15.49629974365234 38.41041946411133 18.26787757873535 32.77348327636719 20.32339859008789 29.10795021057129 C 22.67465972900391 24.91644668579102 24.38930892944336 20.33543968200684 25.88383483886719 15.78676319122314 C 26.98149681091309 12.44469738006592 27.90066528320312 9.098821640014648 28.63810920715332 5.661057949066162 C 28.87024688720703 4.577578067779541 29.03584861755371 3.433688879013062 29.4022274017334 2.387754440307617 C 29.50100898742676 2.105585098266602 29.86386871337891 1.632899880409241 29.88936424255371 1.374354839324951 C 29.94358825683594 0.8271160125732422 29.66015625 0.4609672427177429 29.69767951965332 -4.376608227034656e-15 C 29.37702178955078 0.2161274254322052 29.06076812744141 0.4392189681529999 28.7494945526123 0.6688234210014343" fill="#89c5cc" fill-opacity="0.55" stroke="none" stroke-width="1" stroke-opacity="0.55" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-27.12, -231.98)" d="M 38 328.0000305175781 C 38 339.8170166015625 47.57950592041016 349.3964538574219 59.39643859863281 349.3964538574219 C 71.21343231201172 349.3964538574219 80.79287719726562 339.8170166015625 80.79287719726562 328.0000305175781" fill="#89c5cc" fill-opacity="0.55" stroke="none" stroke-width="1" stroke-opacity="0.55" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-80.13, -186.73)" d="M 114.1304931640625 282.82666015625 L 113 282.82666015625 C 113.0785522460938 281.4083251953125 113.1820220947266 279.9923706054688 113.4191436767578 278.5895690917969 C 114.326286315918 273.2249145507812 117.1620559692383 265.3457641601562 123.3816757202148 264.4749450683594 C 123.6111679077148 264.4427185058594 124.4552993774414 264.4371337890625 125.4776458740234 264.4972534179688 C 125.9621353149414 264.2264404296875 126.5049743652344 264.0625610351562 127.0771026611328 264.0250244140625 C 132.3725738525391 263.6346435546875 138.2861938476562 267.9066162109375 140.840576171875 272.3526611328125 C 142.8999176025391 275.93701171875 142.5528869628906 280.6439208984375 141.2811279296875 284.4522094726562 C 140.4293670654297 287.0016174316406 138.5705108642578 290.6366577148438 135.4706726074219 290.672119140625 C 131.5923461914062 290.7163696289062 131.4053344726562 285.9229736328125 131.3303070068359 283.1209106445312 C 131.2306518554688 279.3953247070312 130.7599334716797 276.1500854492188 127.8242111206055 273.6106567382812 C 127.1401214599609 273.0191650390625 126.3924102783203 272.4985961914062 125.701286315918 271.9153442382812 C 124.619140625 271.0023498535156 123.4232940673828 270.0673217773438 123.2837829589844 268.5567016601562 C 123.0914993286133 266.4727478027344 124.2677154541016 266.0975646972656 126.063850402832 266.4847412109375 C 126.3701477050781 266.5507202148438 129.4544525146484 267.9347534179688 128.997802734375 266.8408813476562 C 128.8582763671875 266.5067138671875 128.3491668701172 266.2417602539062 127.7063903808594 266.0433349609375 C 126.043327331543 265.8624877929688 124.0596160888672 265.6526489257812 123.4892425537109 265.778076171875 C 117.335563659668 267.1281127929688 114.9394607543945 275.6524047851562 114.3031387329102 281.0683288574219 C 114.2345428466797 281.6527709960938 114.1791534423828 282.2392578125 114.1304931640625 282.82666015625 Z" fill="#69a1ac" fill-opacity="0.55" stroke="none" stroke-width="1" stroke-opacity="0.55" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_j6fe41 =
    '<svg viewBox="0.0 0.0 60.6 80.8" ><path transform="matrix(-0.998629, -0.05234, 0.05234, -0.998629, 56.49, 80.82)" d="M 53.88244247436523 73.07475280761719 C 55.35879135131836 73.71282958984375 57.23347473144531 72.78458404541016 56.33451461791992 70.94037628173828 C 55.37138748168945 68.96575164794922 52.20119476318359 69.10673522949219 50.41357040405273 69.24067687988281 C 50.59323501586914 69.24067687988281 51.26707458496094 71.06259918212891 51.47929000854492 71.33196258544922 C 52.10506057739258 72.12715148925781 52.9749870300293 72.68170928955078 53.88244247436523 73.07475280761719 Z M 35.40673446655273 37.73162841796875 C 35.02744674682617 37.44027328491211 35.37565612792969 37.70407104492188 35.40673446655273 37.73162841796875 Z M 54.78987121582031 63.86665725708008 C 55.59795761108398 63.17874908447266 55.57860946655273 62.04034042358398 54.85054779052734 61.30729293823242 C 53.98354339599609 60.4344367980957 52.48990249633789 60.54610443115234 51.378173828125 60.69382858276367 C 50.87520599365234 60.76066207885742 48.19038391113281 61.11794662475586 48.85251617431641 61.52565765380859 C 48.80239105224609 61.50982666015625 48.69746017456055 61.46996688842773 48.58432006835938 61.41456604003906 C 48.5136833190918 61.20148086547852 48.44041061401367 60.98957061767578 48.36448669433594 60.77853393554688 C 48.37973403930664 60.76856994628906 48.39292526245117 60.75772476196289 48.40933609008789 60.74776077270508 C 48.39146423339844 60.75655364990234 48.37885284423828 60.76593017578125 48.36332321166992 60.77502059936523 C 47.6024284362793 58.66672897338867 46.57276153564453 56.67539978027344 45.2640380859375 54.830322265625 C 45.72568893432617 54.98449325561523 46.20110702514648 55.09469985961914 46.67915344238281 55.12987518310547 C 48.09513854980469 55.23421859741211 50.99684524536133 53.98589706420898 49.32527542114258 52.19533157348633 C 47.72259140014648 50.47892379760742 45.47479248046875 52.52829360961914 43.7762565612793 52.88382720947266 C 41.99420547485352 50.65303039550781 40.04653549194336 48.52745056152344 38.01503753662109 46.48101806640625 C 38.13053512573242 46.43792724609375 38.22989273071289 46.35586166381836 38.28265380859375 46.23304748535156 C 39.07315063476562 46.58330535888672 39.90467071533203 47.10004425048828 40.62483215332031 47.21406555175781 C 41.66446685791016 47.37820053100586 43.7797737121582 47.3998908996582 44.50843048095703 46.43881607055664 C 45.40502548217773 45.25702285766602 44.33228302001953 44.39178466796875 43.19181823730469 44.23380661010742 C 41.53784561157227 44.00489044189453 39.43659591674805 44.91702270507812 37.88931274414062 45.54015731811523 C 37.70728302001953 45.51787567138672 37.51354598999023 45.58090209960938 37.40333938598633 45.73126220703125 C 37.36933898925781 45.74444580078125 37.33504486083984 45.75734710693359 37.30164337158203 45.77024459838867 C 35.24640274047852 43.73522567749023 33.12024307250977 41.77496337890625 31.00903129577637 39.85895919799805 C 31.03042030334473 39.85895919799805 31.05182456970215 39.8592414855957 31.07410621643066 39.8592414855957 C 31.61515617370605 40.1749267578125 32.19111251831055 40.42698669433594 32.80720901489258 40.54275894165039 C 34.23198318481445 40.81182479858398 35.88741683959961 40.72683334350586 36.97599792480469 39.64879989624023 C 38.06019592285156 38.57575607299805 38.37029647827148 36.78167724609375 37.13397598266602 35.70512390136719 C 34.65932464599609 33.55022811889648 31.46157646179199 38.92688751220703 30.28506851196289 39.20592880249023 C 28.14044189453125 37.28083038330078 25.88619041442871 35.49496459960938 23.59969902038574 33.74954223632812 C 23.85235214233398 33.81197357177734 24.11028289794922 33.85446548461914 24.37495040893555 33.86560821533203 C 26.53188896179199 33.95851898193359 31.43197441101074 31.0632495880127 28.66216087341309 28.61233329772949 C 26.24845695495605 26.47679138183594 23.81953239440918 30.95802688598633 22.04918479919434 32.57361221313477 C 19.89577674865723 30.9477653503418 17.73180389404297 29.33453559875488 15.62234020233154 27.65095710754395 C 16.73701858520508 27.8851432800293 17.80155944824219 27.8725414276123 18.96135902404785 27.45487403869629 C 20.16132354736328 27.0219612121582 22.08084297180176 25.99785804748535 21.22382164001465 24.3919563293457 C 20.35183906555176 22.75879287719727 18.02900886535645 23.64454650878906 16.8264045715332 24.24071502685547 C 16.1701545715332 24.56576919555664 14.87581062316895 25.61477279663086 13.71570205688477 26.08871841430664 C 10.34034442901611 23.22071838378906 7.379135608673096 20.02239418029785 5.063637733459473 16.1930046081543 C 3.618053674697876 13.80188083648682 2.481118679046631 11.22611236572266 1.636383771896362 8.561798095703125 C 1.097078204154968 6.861219882965088 0.06066428497433662 4.011977195739746 0.1201646849513054 1.758604764938354 C -0.4883145093917847 6.294653415679932 1.320427775382996 11.60948276519775 3.174884796142578 15.53821659088135 C 4.880144596099854 19.15070915222168 7.312018394470215 22.27312278747559 10.11466693878174 25.05172920227051 C 9.554540634155273 27.08644676208496 4.108993053436279 30.26454544067383 7.55206298828125 31.94725227355957 C 9.380435943603516 32.83652496337891 11.11471557617188 31.11102676391602 11.41279983520508 29.36413764953613 C 11.6173849105835 28.16358947753906 11.13289833068848 26.69427490234375 10.6410665512085 25.56524848937988 C 11.52124786376953 26.41083717346191 12.4328031539917 27.22625541687012 13.36954975128174 28.01147079467773 C 14.66360855102539 29.09682655334473 15.98579502105713 30.14731025695801 17.31940078735352 31.18312835693359 C 15.32073783874512 33.26826477050781 13.62719440460205 39.01804351806641 16.4940242767334 39.7935905456543 C 20.72730827331543 40.93522644042969 18.31975936889648 33.33919525146484 17.95368003845215 31.91120338439941 C 17.87101745605469 31.91061592102051 17.8080005645752 31.93905258178711 17.76346206665039 31.99473190307617 C 17.7801570892334 31.86137580871582 17.79980087280273 31.71863174438477 17.82530212402344 31.57442665100098 C 20.37674522399902 33.54583740234375 22.96249771118164 35.47414779663086 25.47116279602051 37.49801635742188 C 25.26364135742188 37.66889572143555 24.95236778259277 38.29671859741211 24.6997127532959 38.63525390625 C 24.12933158874512 39.39878845214844 23.58710289001465 40.19338607788086 23.20635795593262 41.07151794433594 C 22.60462951660156 42.45935440063477 22.06941032409668 44.65059661865234 23.89338684082031 45.35257339477539 C 25.87709999084473 46.11786651611328 26.67023468017578 43.62971115112305 26.60751533508301 42.17329025268555 C 26.56414031982422 41.16618728637695 26.23966217041016 40.22444915771484 26.04534530639648 39.24520111083984 C 25.98466873168945 38.93978500366211 26.083740234375 37.54374313354492 25.69567489624023 38.16248321533203 C 25.7038745880127 37.94119262695312 25.69861221313477 37.78174591064453 25.68276977539062 37.66949081420898 C 26.1332836151123 38.03469085693359 26.58083534240723 38.40428924560547 27.02547836303711 38.77711868286133 C 27.00848579406738 38.82782745361328 26.99675750732422 38.8829231262207 26.99675750732422 38.94623184204102 C 26.99675750732422 39.38149261474609 27.4422664642334 39.52569198608398 27.74182510375977 39.38237380981445 C 28.32949638366699 39.88504028320312 28.91189193725586 40.39445495605469 29.48491096496582 40.91529846191406 C 30.69951629638672 42.01852798461914 31.93288421630859 43.15401458740234 33.15923309326172 44.31557846069336 C 32.91829299926758 44.54536819458008 33.03435897827148 44.84023284912109 32.81072616577148 45.0826301574707 C 32.58709335327148 45.32444000244141 32.13014984130859 45.47568130493164 31.86430549621582 45.70312118530273 C 31.19602966308594 46.2761344909668 30.65965843200684 47.08803558349609 30.28214645385742 47.87910842895508 C 29.65929985046387 49.18605422973633 28.90807723999023 51.89871597290039 30.95392799377441 52.39874267578125 C 33.06279754638672 52.91548156738281 33.98225402832031 50.29397583007812 34.03179550170898 48.6825065612793 C 34.04145812988281 48.37006378173828 33.66188812255859 45.58148193359375 33.43035125732422 44.57380294799805 C 35.70013427734375 46.73308944702148 37.93914031982422 48.97912216186523 39.98117828369141 51.27674865722656 C 39.40055465698242 51.3125114440918 37.81544494628906 52.58955383300781 37.49919128417969 52.93160629272461 C 36.72833633422852 53.76665496826172 35.528076171875 55.58535003662109 37.00148773193359 56.43710708618164 C 38.31137847900391 57.19242858886719 39.8102912902832 55.92036819458008 40.29128646850586 54.73535537719727 C 40.37040710449219 54.54014587402344 40.59141540527344 52.75075912475586 40.57440948486328 51.95410919189453 C 41.42089080810547 52.92926025390625 42.23103332519531 53.91262054443359 42.98868179321289 54.90183639526367 C 43.49398803710938 55.55955505371094 43.96940994262695 56.23691558837891 44.41727447509766 56.93040084838867 C 44.32143402099609 56.99165344238281 44.23379516601562 57.09424209594727 44.15230941772461 57.22027206420898 C 42.05838775634766 57.68952941894531 39.53742599487305 61.12704086303711 42.07919692993164 62.14410018920898 C 43.28940582275391 62.62742233276367 44.51165008544922 61.43449783325195 45.04216384887695 60.48250579833984 C 45.15089797973633 60.28788375854492 45.29306030273438 59.32972717285156 45.41030120849609 58.57382583618164 C 46.71550750732422 60.88112258911133 47.74927139282227 63.34200286865234 48.57084274291992 65.87763214111328 C 48.38940811157227 65.93302917480469 48.2411003112793 66.08162689208984 48.23317337036133 66.32460784912109 C 47.23810577392578 66.96298980712891 46.45347595214844 67.49233245849609 45.79633712768555 68.65447235107422 C 45.38803100585938 69.3760986328125 44.67080688476562 71.01394653320312 45.99798583984375 71.33313751220703 C 47.72552490234375 71.74846649169922 48.65789031982422 69.09442138671875 48.72998428344727 67.80741119384766 C 48.73848342895508 67.65792846679688 48.71504974365234 67.22590637207031 48.68866729736328 66.83020782470703 C 48.7481689453125 66.83519744873047 48.80795288085938 66.83138275146484 48.8659782409668 66.81790161132812 C 49.33992767333984 68.38980865478516 49.73649978637695 69.98633575439453 50.06917953491211 71.58901214599609 C 49.15617370605469 71.93663024902344 49.25112152099609 76.82088470458984 49.90592193603516 77.48270416259766 C 51.36908340454102 78.96464538574219 52.22611618041992 76.66818237304688 52.09011077880859 75.48522186279297 C 51.92977905273438 74.09034729003906 51.22869110107422 72.85053253173828 50.41445159912109 71.76018524169922 C 50.327392578125 71.64499664306641 50.35054016113281 71.64939117431641 50.33853912353516 71.81733703613281 C 50.32242584228516 71.73557281494141 50.29163360595703 71.67607116699219 50.24855804443359 71.63414764404297 C 50.24884414672852 70.89553070068359 50.28548049926758 70.1375732421875 50.21485900878906 69.48746490478516 C 50.01230239868164 67.62628173828125 49.69634628295898 65.76009368896484 49.28424072265625 63.9340705871582 C 49.18400573730469 63.49002456665039 49.0726203918457 63.05007553100586 48.95099258422852 62.61452865600586 C 49.73064422607422 63.21128082275391 50.76617813110352 63.72333145141602 51.16919326782227 63.87926483154297 C 52.21496963500977 64.28373718261719 53.81560897827148 64.69583892822266 54.78987121582031 63.86665725708008 Z M 1.007887680311444e-16 1.758604764938354 C 0.01347520388662815 1.104992628097534 0.0996544361114502 0.5029535889625549 0.2931050956249237 0 C 0.1579780131578445 0.5683251619338989 0.06242304295301437 1.156281232833862 1.007887680311444e-16 1.758604764938354 Z" fill="#f2f2f2" fill-opacity="0.78" stroke="none" stroke-width="1.0000007152557373" stroke-opacity="0.78" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_z2g9dv =
    '<svg viewBox="3.0 3.0 19.4 19.4" ><path  d="M 22.4346923828125 12.71734619140625 C 22.4346923828125 18.0840892791748 18.0840892791748 22.4346923828125 12.71734619140625 22.4346923828125 C 7.350604057312012 22.4346923828125 3 18.0840892791748 3 12.71734619140625 C 3 7.350604057312012 7.350604057312012 3 12.71734619140625 3 C 18.0840892791748 3 22.4346923828125 7.350604057312012 22.4346923828125 12.71734619140625 Z" fill="none" fill-opacity="0.3" stroke="#005c7e" stroke-width="2" stroke-opacity="0.3" stroke-linecap="round" stroke-linejoin="round" /><path transform="translate(-5.28, -3.17)" d="M 18 12 L 18 19.77387809753418" fill="none" fill-opacity="0.3" stroke="#005c7e" stroke-width="2" stroke-opacity="0.3" stroke-linecap="round" stroke-linejoin="round" /><path transform="translate(-3.17, -5.28)" d="M 12 18 L 19.77387809753418 18" fill="none" fill-opacity="0.3" stroke="#005c7e" stroke-width="2" stroke-opacity="0.3" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_xm7ra =
    '<svg viewBox="215.0 389.0 12.8 7.3" ><path transform="translate(215.02, 381.35)" d="M 9.659252166748047 8.429463386535645 L 8.891009330749512 7.6640625 L 5.405882835388184 11.13615608215332 L 6.174249649047852 11.90173149108887 L 9.659252166748047 8.429463386535645 Z M 11.99171733856201 7.6640625 L 6.174249649047852 13.43270778656006 L 3.896637916564941 11.16354465484619 L 3.128370761871338 11.92902088165283 L 6.174249649047852 14.99109840393066 L 12.760009765625 8.429463386535645 L 11.99171733856201 7.6640625 Z M 0 11.92902088165283 L 3.073392868041992 14.99109840393066 L 3.841710090637207 14.22567272186279 L 0.7958557605743408 11.16354465484619 L 0 11.92902088165283 Z" fill="#005c7e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
