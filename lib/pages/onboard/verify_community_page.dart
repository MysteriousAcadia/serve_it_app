import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:expandable/expandable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search_widget/search_widget.dart';
import 'package:serveit/blocs/request_service_bloc/request_service_bloc.dart';
import 'package:serveit/blocs/verify_community_bloc/verify_community_bloc.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/models/community.dart';
import 'package:serveit/pages/dashboard/home_page.dart';
import 'package:serveit/pages/onboard/verify_waiting_page.dart';
import 'package:serveit/utils/constants.dart';
import 'package:serveit/models/service.dart';

class VerifyCommunityPage extends StatelessWidget {
  final Community community;
  VerifyCommunityBloc verifyCommunityBloc;
  VerifyCommunityPage(this.community);
  @override
  Widget build(BuildContext context) {
    verifyCommunityBloc = BlocProvider.of<VerifyCommunityBloc>(context);
    Future getImage() async {
      FilePickerResult result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
      );
      if (result != null) {
        File file = File(result.files.single.path);
        verifyCommunityBloc.add(AddDocumentEvent(file));
      }
    }

    Widget addFileButton =
        IconButton(icon: Icon(Icons.add_circle), onPressed: getImage);

    Widget button = Button(
      "Verify Now",
      Constants.white,
      Constants.buttonTextStyle,
      () {
        verifyCommunityBloc.add(UploadDocumentEvent(community.id));
      },
    );
    Widget body = BlocBuilder<VerifyCommunityBloc, VerifyCommunityState>(
      builder: (context, state) {
        if (state is VerifyCommunityInitial) {
          return addFileButton;
        } else if (state is VerifyCommunityFileAdded) {
          return Column(
            children: <Widget>[
              Text("File added successfully"),
              addFileButton,
              button,
            ],
          );
        } else if(state is VerifyCommunityFileUploading){
          return Column(
            children: <Widget>[
              Text("Uploading File..."),
              addFileButton,
              CircularProgressIndicator(),
            ],
          );
        } 
        else if (state is VerifyCommunitySuccess) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => VerifyWaitingPage()));
          return Text("Success");
        }
        return Text("state is " + state.toString());
      },
    );

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'Upload Documents for verification',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 27,
                  color: const Color(0xff606060),
                  letterSpacing: -0.675,
                  fontWeight: FontWeight.w700,
                  height: 1.1851851851851851,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'Documents',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 21,
                  color: const Color(0xff606060),
                  letterSpacing: -0.525,
                  fontWeight: FontWeight.w700,
                  height: 1.1904761904761905,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            body,
          ],
        ),
      ),
    );
  }
}
