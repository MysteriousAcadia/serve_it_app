import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serveit/blocs/login_bloc/login_bloc.dart';
import 'package:serveit/blocs/reg_bloc/user_reg_bloc.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/constants.dart';
import 'package:serveit/pages/basic_profile_page.dart';
import 'package:serveit/sign_in.dart';

import '../first_page.dart';

class HomePage extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  UserRegBloc userRegBloc;

  @override
  Widget build(BuildContext context) {
    userRegBloc = BlocProvider.of<UserRegBloc>(context);

    final emailField = BlocBuilder<UserRegBloc, UserRegState>(
        builder: (context, state) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x0d000000),
                  offset: Offset(0, 5),
                  blurRadius: 10,
                ),
              ],
            ),
            child: TextField(
                controller: emailCtrl,
                obscureText: false,
                style: Constants.buttonTextStyle
                    .copyWith(color: const Color(0xff8ac4cf)),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Email",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: Constants.buttonBorderRadius,
                        borderSide: new BorderSide(color: Constants.white)),
                    fillColor: Colors.white,
                    errorText: state is UserRegUnSuccessfulState
                        ? state.validateEmail ? state.emailError : null
                        : null))));

    final passwordField = BlocBuilder<UserRegBloc, UserRegState>(
        builder: (context, state) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x0d000000),
                  offset: Offset(0, 5),
                  blurRadius: 10,
                ),
              ],
            ),
            child: TextField(
              controller: passwordCtrl,
              obscureText: true,
              style: Constants.buttonTextStyle
                  .copyWith(color: const Color(0xff8ac4cf)),
              decoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Password",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: Constants.buttonBorderRadius,
                      borderSide: new BorderSide(color: Constants.white)),
                  fillColor: Colors.white,
                  errorText: state is UserRegUnSuccessfulState
                      ? state.validatePassword ? state.passwordError: null
                      : null),
            )));
    final repeatPasswordField = BlocBuilder<UserRegBloc, UserRegState>(
        builder: (context, state) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x0d000000),
                  offset: Offset(0, 5),
                  blurRadius: 10,
                ),
              ],
            ),
            child: TextField(
              controller: passwordCtrl,
              obscureText: true,
              style: Constants.buttonTextStyle
                  .copyWith(color: const Color(0xff8ac4cf)),
              decoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Repeat Password",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: Constants.buttonBorderRadius,
                      borderSide: new BorderSide(color: Constants.white)),
                  fillColor: Colors.white,
                  errorText: state is UserRegUnSuccessfulState
                      ? state.passwordRepeat ? state.passwordRepeatError : null
                      : null),
            )));

    loadingOrError(mainContext) {
      final bb = BlocBuilder<UserRegBloc, UserRegState>(builder: (context, state) {
        if (state is LoginLoadingState) {
          return CircularProgressIndicator(
            strokeWidth: 2.0,
          );
        } else if (state is UserRegUnSuccessfulState) {
          if (state.message != null) {
            return Text("${state.message}");
          }
        } else if (state is UserRegSuccessfulState) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => BasicProfilePage()));
          });

          return Text("Success");
        }
        return Container();
      });
      return bb;
    }

    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Center(
        child: SingleChildScrollView(child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: Constants.buttonTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 33,
                    color: Constants.white,
                  ),
                ),
                loadingOrError(context),
                SizedBox(height: 70.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(height: 25.0),
                repeatPasswordField,
                SizedBox(
                  height: 35.0,
                ),
                Button(
                    "Sign Up",
                    Constants.green,
                    Constants.buttonTextStyle.copyWith(color: Constants.white),
                    () => {
                          userRegBloc.add(SignupButtonPressedEvent(
                              loginType: "EMAIL",
                              email: emailCtrl.text,
                              password: passwordCtrl.text))
                        }),
                SizedBox(
                  height: 45.0,
                ),
                Text(
                  "Or Sign up with:",
                  textAlign: TextAlign.center,
                  style: Constants.buttonTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Constants.white,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Button(
                          "Google",
                          Colors.red[300],
                          Constants.buttonTextStyle
                              .copyWith(color: Constants.white),
                          () => {
                                userRegBloc.add(
                                  SignupButtonPressedEvent(loginType: "GOOGLE"),
                                ),
                              }),
                    ),
                    Expanded(
                      child: Button(
                          "Facebook",
                          Colors.blue[300],
                          Constants.buttonTextStyle
                              .copyWith(color: Constants.white),
                          () => {
                                userRegBloc.add(
                                  SignupButtonPressedEvent(loginType: "FACEBOOK"),
                                ),
                              }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),), 
    );
  }
}

class SignUpPage extends StatelessWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRegBloc(),
      child: HomePage(),
    );
  }
}
