import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/utils/constants.dart';
import 'package:serveit/pages/dashboard/home_page.dart';

class OnboardingPage extends StatelessWidget {
  final pageList = [
    PageModel(
        color: const Color(0xFF678FB4),
        heroAssetPath: 'assets/ss.png',
        title: Text('Hotels',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Column(children: <Widget>[
          Text('All hotels and hostels are sorted by hospitality rating',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ))
        ]),
        iconAssetPath: 'assets/ss.png'),
    PageModel(
        color: const Color(0xFF65B0B4),
        heroAssetPath: 'assets/temp_image.jpg',
        title: Text('Banks',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text(
            'We carefully verify all banks before adding them into the app',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconAssetPath: 'assets/temp_image.jpg'),
    PageModel(
      color: const Color(0xFF9B90BC),
      heroAssetPath: 'assets/ss.png',
      title: Text('Store',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text('All local stores are categorized for your convenience',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          )),
      iconAssetPath: 'assets/temp_image.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FancyOnBoarding(
        doneButtonText: "Done",
        skipButtonText: "Skip",
        pageList: pageList,
        onDoneButtonPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage())),
        onSkipButtonPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) =>  HomePage())),
      ),
    );
  }
}
