import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serveit/blocs/profile_bloc/profile_bloc.dart';
import 'package:serveit/blocs/reg_bloc/user_reg_bloc.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/pages/onboard/select_community_page.dart';
import 'package:serveit/utils/constants.dart';

class BasicProfilePage extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController mobileCtrl = TextEditingController();
  TextEditingController locality = TextEditingController();
  ProfileBloc profileBloc;
  var compressedFile;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    compressedFile = await ImageCropper.cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 75,
      maxHeight: 700,
      maxWidth: 700,
      compressFormat: ImageCompressFormat.jpg,
    );
    profileBloc.add(
      ProfileUpdate(
        picture: compressedFile,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    profileBloc = BlocProvider.of<ProfileBloc>(context);
    profileBloc.add(GetLocation());

    final nameField = BlocBuilder<ProfileBloc, ProfileState>(
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
          onChanged: (value) =>
              profileBloc.add(ProfileUpdate(name: nameCtrl.text)),
          controller: nameCtrl,
          obscureText: false,
          decoration: InputDecoration(
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Name",
            enabledBorder: OutlineInputBorder(
                borderRadius: Constants.buttonBorderRadius,
                borderSide: new BorderSide(color: Constants.white)),
            fillColor: Colors.white,
            errorText: state.nameError,
          ),
          style: Constants.buttonTextStyle
              .copyWith(color: const Color(0xff8ac4cf)),
        ),
      ),
    );

    final mobileField = BlocBuilder<ProfileBloc, ProfileState>(
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
          keyboardType: TextInputType.number,
          controller: mobileCtrl,
          onChanged: (value) =>
              profileBloc.add(ProfileUpdate(phone: mobileCtrl.text)),
          decoration: InputDecoration(
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Mobile No.",
            enabledBorder: OutlineInputBorder(
                borderRadius: Constants.buttonBorderRadius,
                borderSide: new BorderSide(color: Constants.white)),
            fillColor: Colors.white,
            errorText: state.phoneError,
          ),
          style: Constants.buttonTextStyle.copyWith(
            color: const Color(0xff8ac4cf),
          ),
        ),
      ),
    );

    final localityField = BlocBuilder<ProfileBloc, ProfileState>(
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
          controller: locality,
          onChanged: (value) =>
              profileBloc.add(ProfileUpdate(locality: locality.text)),
          style: Constants.buttonTextStyle
              .copyWith(color: const Color(0xff8ac4cf)),
          decoration: InputDecoration(
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Locality",
              enabledBorder: OutlineInputBorder(
                  borderRadius: Constants.buttonBorderRadius,
                  borderSide: new BorderSide(color: Constants.white)),
              fillColor: Colors.white,
              errorText: state.localityError),
        ),
      ),
    );

    final profilePic = BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        String url = "";
        print("Here" + state.toString());
        if (state is ProfileLoaded && state.picture != null) {
          return GestureDetector(
            onTap: getImage,
            child: Container(
              width: 150.0,
              height: 150.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: FileImage(state.picture),
                ),
              ),
            ),
          );
        } else if (state is ProfileLoaded && state.picURL == "") {
          url =
              "https://firebasestorage.googleapis.com/v0/b/serve-it-281307.appspot.com/o/various%2Fprofile_add.png?alt=media&token=5aa34120-f8c8-416f-bdb3-c52e90643932";
          return GestureDetector(
            onTap: getImage,
            child: Container(
              width: 150.0,
              height: 150.0,
              decoration: new BoxDecoration(
                // shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(url),
                ),
              ),
            ),
          );
        } else if (compressedFile != null) {
          return GestureDetector(
            onTap: getImage,
            child: Container(
              width: 150.0,
              height: 150.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: FileImage(compressedFile),
                ),
              ),
            ),
          );
        } else if (state is ProfileUploaded) {
          print("CAMMMEE");
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SelectCommunityPage()));
          });
        } else {
          url =
              "https://firebasestorage.googleapis.com/v0/b/serve-it-281307.appspot.com/o/various%2Fprofile_add.png?alt=media&token=5aa34120-f8c8-416f-bdb3-c52e90643932";
        }
        return GestureDetector(
          onTap: getImage,
          child: Container(
            width: 150.0,
            height: 150.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(url),
              ),
            ),
          ),
        );
      },
    );

    loadingOrError(mainContext) {
      final bb =
          BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        if (state is ProfileLoadingState) {
          return CircularProgressIndicator(
            strokeWidth: 2.0,
          );
        } else {
          return Button("Next", Constants.green,
              Constants.buttonTextStyle.copyWith(color: Constants.white), () {
            profileBloc.add(ProfileUpload());
          });
        }
        return Container();
      });
      return bb;
    }

    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Constants.primaryColor,
      body: Center(
        child: Container(
          child: ListView(
            children: <Widget>[
              Padding(
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
                    profilePic,
                    SizedBox(height: 35.0),
                    SizedBox(height: 30.0),
                    nameField,
                    SizedBox(height: 25.0),
                    mobileField,
                    SizedBox(height: 25.0),
                    localityField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loadingOrError(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const String _svg_1i58gx =
    '<svg viewBox="184.8 767.3 7.2 13.2" ><path transform="translate(184.8, 767.31)" d="M 7.165123462677002 13.1683349609375 L 0 6.58416748046875 L 7.165123462677002 0 L 7.165123462677002 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /></svg>';
