import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serveit/blocs/login_bloc/login_bloc.dart';
import 'package:serveit/blocs/profile_bloc/profile_bloc.dart';
import 'package:serveit/blocs/reg_bloc/user_reg_bloc.dart';
import 'package:serveit/blocs/select_community_bloc/select_community_bloc.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/components/community_card.dart';
import 'package:serveit/pages/onboard/verify_community_page.dart';
import 'package:serveit/utils/constants.dart';
import 'package:serveit/pages/onboard/onboarding_page.dart';

class SelectCommunityPage extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController mobileCtrl = TextEditingController();
  TextEditingController locality = TextEditingController();
  SelectCommunityBloc selectCommunityBloc;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    selectCommunityBloc = BlocProvider.of<SelectCommunityBloc>(context);

    final nameField = Container(
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
        onChanged: (value) {
          selectCommunityBloc.add(FetchCommunitiesEvent(value));
        },
        onEditingComplete: () {
          selectCommunityBloc.add(FetchCommunitiesEvent(nameCtrl.text));
        },
        controller: nameCtrl,
        obscureText: false,
        style:
            Constants.buttonTextStyle.copyWith(color: const Color(0xff8ac4cf)),
      ),
    );

    loadingOrList(mainContext) {
      final bb = BlocBuilder<SelectCommunityBloc, SelectCommunityState>(
          builder: (context, state) {
        if (state is SelectCommunityLoading) {
          return CircularProgressIndicator(
            strokeWidth: 2.0,
          );
        } else if (state is SelectCommunityInitial) {
          return Text("Please enter Community Name");
        } else if (state is SelectCommunityLoaded) {
          return Row(
            children: state.communities
                .map((e) => CommunityCard(
                      community: e,
                      selectCommunityBloc: selectCommunityBloc,
                    ))
                .toList(),
          );
        } 
        return Container();
      });
      return bb;
    }

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
                  "Select Community",
                  textAlign: TextAlign.center,
                  style: Constants.buttonTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 33,
                    color: Constants.white,
                  ),
                ),
                SizedBox(height: 35.0),
                nameField,
                SizedBox(height: 35.0),
                loadingOrList(context),
                SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const String _svg_1i58gx =
    '<svg viewBox="184.8 767.3 7.2 13.2" ><path transform="translate(184.8, 767.31)" d="M 7.165123462677002 13.1683349609375 L 0 6.58416748046875 L 7.165123462677002 0 L 7.165123462677002 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /></svg>';
