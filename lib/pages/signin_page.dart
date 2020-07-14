import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/constants.dart';
import 'package:serveit/sign_in.dart';

import 'XDLoginSelected.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: Constants.buttonTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: Constants.buttonBorderRadius)),
    );
    final passwordField = TextField(
      obscureText: true,
      style: Constants.buttonTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: Constants.buttonBorderRadius)),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => XDLoginSelected()));
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: Constants.buttonTextStyle.copyWith(
                color: Colors.white, )),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Log In",
                style: Constants.buttonTextStyle.copyWith(fontWeight: FontWeight.bold,fontSize: 33),),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                Button(
                  "Login",
                  Constants.green,
                  Constants.buttonTextStyle.copyWith(color: Constants.white),
                    ()=>{}
                ),
                SizedBox(
                  height: 15.0,
                ),
                Button(
                    "Sign in with Google",
                    Constants.primaryColor,
                    Constants.buttonTextStyle.copyWith(color: Constants.white),
                    () => {signInWithGoogle().then((value) => print(value)).catchError((onError)=>print(onError))}),
                Button(
                    "Sign in with Apple",
                    Constants.primaryColor,
                    Constants.buttonTextStyle.copyWith(color: Constants.white),
                    () => {}),
                Button(
                    "Sign in with Facebook",
                    Constants.primaryColor,
                    Constants.buttonTextStyle.copyWith(color: Constants.white),
                    () => {signInWithFacebook().then((value) => print(value)).catchError((onError)=>print(onError))}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
