import 'package:flutter/material.dart';
import 'package:serveit/pages/intro_page.dart';
import 'service_locator.dart';

import 'login_page.dart';
import './pages/XDOnboarding1.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroPage(),
    );
  }
}