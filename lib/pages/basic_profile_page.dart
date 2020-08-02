import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serveit/blocs/login_bloc/login_bloc.dart';
import 'package:serveit/blocs/reg_bloc/user_reg_bloc.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/constants.dart';
import 'package:serveit/pages/onboarding_page.dart';
import 'package:serveit/sign_in.dart';

import '../first_page.dart';

class HomePage extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  LoginBloc loginBloc;
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    _image = File(pickedFile.path);
  }

  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LoginBloc>(context);

    final firstNameField = BlocBuilder<LoginBloc, LoginState>(
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
          controller: firstNameCtrl,
          obscureText: false,
          style: Constants.buttonTextStyle
              .copyWith(color: const Color(0xff8ac4cf)),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "First Name",
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

    final lastNameField = BlocBuilder<LoginBloc, LoginState>(
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
              controller: lastNameCtrl,
              style: Constants.buttonTextStyle
                  .copyWith(color: const Color(0xff8ac4cf)),
              decoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Last Name",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: Constants.buttonBorderRadius,
                      borderSide: new BorderSide(color: Constants.white)),
                  fillColor: Colors.white,
                  errorText: state is LoginFailureState
                      ? state.validateEmail ? state.emailError : null
                      : null),
            )));
    final addressField = BlocBuilder<LoginBloc, LoginState>(
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
          controller: addressCtrl,
          style: Constants.buttonTextStyle
              .copyWith(color: const Color(0xff8ac4cf)),
          decoration: InputDecoration(
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Address",
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
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => FirstScreen()));
          });

          return Text("Success");
        }
        return Container();
      });
      return bb;
    }

    Widget circularImageView = GestureDetector(
      onTap: getImage,
      child: Container(
        width: 150.0,
        height: 150.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            fit: BoxFit.fill,
            image: new NetworkImage("https://picsum.photos/200"),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Basic Profile!",
                  textAlign: TextAlign.center,
                  style: Constants.buttonTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 33,
                    color: Constants.white,
                  ),
                ),
                SizedBox(height: 35.0),
                circularImageView,
                SizedBox(height: 35.0),
                loadingOrError(context),
                SizedBox(height: 30.0),
                firstNameField,
                SizedBox(height: 25.0),
                lastNameField,
                SizedBox(height: 25.0),
                addressField,
                SizedBox(
                  height: 35.0,
                ),
                Button(
                    "Next",
                    Constants.green,
                    Constants.buttonTextStyle.copyWith(color: Constants.white),
                    () => {
                         SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => OnboardingPage()));
                         })
          
                        }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BasicProfilePage extends StatelessWidget {
  BasicProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: HomePage(),
    );
  }
}

const String _svg_1i58gx =
    '<svg viewBox="184.8 767.3 7.2 13.2" ><path transform="translate(184.8, 767.31)" d="M 7.165123462677002 13.1683349609375 L 0 6.58416748046875 L 7.165123462677002 0 L 7.165123462677002 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /></svg>';
