import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serveit/blocs/login_bloc/login_bloc.dart';
import 'package:serveit/blocs/reg_bloc/user_reg_bloc.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/constants.dart';
import 'package:serveit/sign_in.dart';

import 'XDLoginSelected.dart';

class MyHomePageParent extends StatelessWidget {
  MyHomePageParent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>LoginBloc(),
    child: MyHomePage(),);
    
  }
}

class MyHomePage extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {

    loginBloc = BlocProvider.of<LoginBloc>(context); 

    final emailField = TextField(
      controller: emailCtrl,
      obscureText: false,
      style: Constants.buttonTextStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: Constants.buttonBorderRadius)),
    );
    final passwordField = TextField(
      controller: passwordCtrl ,
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
          
        
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: Constants.buttonTextStyle.copyWith(
              color: Colors.white,
            )),
      ),
    );

    return  Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<LoginBloc,LoginState>(builder: (context,state){
                  if(state is LoginInitial)
                  {
                    return Text("Initial");
                  }
                  else if( state is LoginLoadingState)
                  {
                    return Text("Loading");
                  }
                  else if(state is LoginFailureState)
                  {
                    return Text("Failure");
                  }
                  else if(state is LoginSuccessState)
                  {
                    return Text("Success");
                  }
                })
                ,
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
                      loginBloc.add(OnLoginPressed(loginType: "email",email: emailCtrl.text,password: passwordCtrl.text))
                    }),
                SizedBox(
                  height: 15.0,
                ),
                Button(
                    emailCtrl.text,
                    Constants.primaryColor,
                    Constants.buttonTextStyle.copyWith(color: Constants.white),
                    () => {
                          signInWithGoogle()
                              .then((value) => print(value))
                              .catchError((onError) => print(onError))
                        }),
                Button(
                    passwordCtrl.text,
                    Constants.primaryColor,
                    Constants.buttonTextStyle.copyWith(color: Constants.white),
                    () => {}),
                Button(
                    "Sign in with Facebook",
                    Constants.primaryColor,
                    Constants.buttonTextStyle.copyWith(color: Constants.white),
                    () => {
                          signInWithFacebook()
                              .then((value) => print(value))
                              .catchError((onError) => print(onError))
                        }),
              ],
            ),
          ),
        ),
      ),
    )
    ;
  }
}
