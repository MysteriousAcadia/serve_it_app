import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/pages/onboard/basic_profile_page.dart';
import 'package:serveit/pages/privacy/privacy_policy_page.dart';
import 'package:serveit/pages/privacy/terms_of_service_page.dart';
import 'package:serveit/utils/constants.dart';
import 'package:serveit/pages/auth/signin_page.dart';
import 'package:serveit/pages/auth/signup_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 247.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(31.0),
              color: const Color(0xffdcf3e9),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x21000000),
                  offset: Offset(0, 4),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.album, size: 120),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Julia Michaels  ',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 28,
                    color: const Color(0xff005c7e),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
                SvgPicture.string(
                  _svg_gj78bz,
                  allowDrawingOutsideViewBox: true,
                ),
              ],
            ),
          ),
          generateOptions(
            "Edit Profile",
            Constants.cardColors[3],
            () {
              SchedulerBinding.instance.addPostFrameCallback(
                (_) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => BasicProfilePage()));
                },
              );
            },
          ),
          // generateOptions("Payment Methods", Constants.cardColors[1]),
          // generateOptions("Services & Subscription", Constants.cardColors[2]),
          // generateOptions("Accounts", Constants.cardColors[3]),
          generateOptions(
            "Privacy policy",
            Constants.cardColors[4],
            () {
              SchedulerBinding.instance.addPostFrameCallback(
                (_) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => PrivacyPolicyPage()));
                },
              );
            },
          ),
          generateOptions(
            "Terms of Service",
            Constants.cardColors[5],
            () {
              SchedulerBinding.instance.addPostFrameCallback(
                (_) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => TermsOfServicePage()));
                },
              );
            },
          ),
        ],
      ),
    );
  }

  generateOptions(String text, Color color, dynamic onClick) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          width: double.infinity,
          height: 60.0,
          decoration: BoxDecoration(
            color: color,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(100, 2, 10, 2),
            child: Row(
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 17,
                    color: const Color(0xff005c7e),
                    letterSpacing: -0.42500000000000004,
                    height: 1.4705882352941178,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: onClick,
    );
  }
}

const String _svg_gj78bz =
    '<svg viewBox="299.0 149.6 13.4 16.4" ><path transform="translate(294.5, 148.06)" d="M 11.22351169586182 1.5 L 4.5 4.488226890563965 L 4.5 8.97056770324707 C 4.5 13.11673259735107 7.368698120117188 16.99395751953125 11.22351169586182 17.93524932861328 C 15.07832431793213 16.99395751953125 17.947021484375 13.11673259735107 17.947021484375 8.97056770324707 L 17.947021484375 4.488226890563965 L 11.22351169586182 1.5 Z M 9.729397773742676 13.45290851593018 L 6.741170883178711 10.46468067169189 L 7.794520378112793 9.411331176757812 L 9.729397773742676 11.33873748779297 L 14.65250205993652 6.415633201599121 L 15.70585155487061 7.47645378112793 L 9.729397773742676 13.45290851593018 Z" fill="#005c7e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
