import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serveit/blocs/login_bloc/login_bloc.dart';
import 'package:serveit/blocs/reg_bloc/user_reg_bloc.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/constants.dart';
import 'package:serveit/sign_in.dart';

import '../first_page.dart';
import 'XDLoginSelected.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LoginBloc>(context);

    final emailField = BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) => TextField(
            controller: emailCtrl,
            obscureText: false,
            style: Constants.buttonTextStyle,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Email",
                border: OutlineInputBorder(
                    borderRadius: Constants.buttonBorderRadius),
                errorText: state is LoginFailureState
                    ? state.validateEmail ? state.emailError : null
                    : null)));

    final passwordField = BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) => TextField(
              controller: passwordCtrl,
              obscureText: true,
              style: Constants.buttonTextStyle,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: Constants.buttonBorderRadius),
                  errorText: state is LoginFailureState
                      ? state.validateEmail ? state.emailError : null
                      : null),
            ));
    
    final loadingOrError = BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                  if (state is LoginLoadingState) {
                    return CircularProgressIndicator(strokeWidth: 2.0,);
                  } else if (state is LoginFailureState) {
                      if(state.message!=null){
                    return Text("${state.message}");
                    }
                  } else if (state is LoginSuccessState) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>FirstScreen()));
                    return Text("Success");
                  }
                });

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
                loadingOrError,
                Text(
                  "Log In",
                  style: Constants.buttonTextStyle
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 33),
                ),
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
                    () => {
                          loginBloc.add(OnLoginEvent(
                              loginType: "EMAIL",
                              email: emailCtrl.text,
                              password: passwordCtrl.text))
                        }),
                SizedBox(
                  height: 15.0,
                ),
                Button(
                    "Sign in with Google",
                    Constants.primaryColor,
                    Constants.buttonTextStyle.copyWith(color: Constants.white),
                    () => {
                          loginBloc.add(OnLoginEvent(loginType: "GOOGLE"))
                        }),
                Button(
                    "Login with Apple",
                    Constants.primaryColor,
                    Constants.buttonTextStyle.copyWith(color: Constants.white),
                    () => {}),
                Button(
                    "Sign in with Facebook",
                    Constants.primaryColor,
                    Constants.buttonTextStyle.copyWith(color: Constants.white),
                    () => {
                          loginBloc.add(OnLoginEvent(loginType: "FACEBOOK"))
                        }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePageParent extends StatelessWidget {
  MyHomePageParent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: HomePage(),
    );
  }
}
