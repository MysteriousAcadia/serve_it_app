import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serveit/blocs/auth_bloc/auth_bloc.dart';
import 'package:serveit/blocs/login_bloc/login_bloc.dart';
import 'package:serveit/blocs/reg_bloc/user_reg_bloc.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/pages/dashboard/home_page.dart';
import 'package:serveit/utils/constants.dart';
import 'package:serveit/pages/dashboard/home_page.dart';
import 'package:serveit/pages/onboard/onboarding_page.dart';

class HomePage1 extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  LoginBloc loginBloc;
  AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    authBloc = BlocProvider.of<AuthBloc>(context);

    final emailField = BlocBuilder<LoginBloc, LoginState>(
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
                    errorText: state is LoginFailureState
                        ? state.validateEmail ? state.emailError : null
                        : null))));

    final passwordField = BlocBuilder<LoginBloc, LoginState>(
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
              errorText: state is LoginFailureState
                  ? state.validateEmail ? state.emailError : null
                  : null),
        ),
      ),
    );

    loadingOrError(mainContext) {
      final bb = BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        if (state is LoginLoadingState) {
          return CircularProgressIndicator(
            strokeWidth: 2.0,
          );
        } else if (state is LoginFailureState) {
          if (state.message != null) {
            return Text("${state.message}");
          }
        } else if (state is LoginSuccessState) {
          authBloc.add(RefreshLoginToken());
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()));
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
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sign In",
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
                  SizedBox(
                    height: 35.0,
                  ),
                  Button(
                      "Login",
                      Constants.green,
                      Constants.buttonTextStyle
                          .copyWith(color: Constants.white),
                      () => {
                            loginBloc.add(OnLoginEvent(
                                loginType: "EMAIL",
                                email: emailCtrl.text,
                                password: passwordCtrl.text))
                          }),
                  SizedBox(
                    height: 45.0,
                  ),
                  Text(
                    "Or Continue up with:",
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
                                  loginBloc.add(
                                    OnLoginEvent(loginType: "GOOGLE"),
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
                                  loginBloc.add(
                                    OnLoginEvent(loginType: "FACEBOOK"),
                                  ),
                                }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage1();
  }
}
