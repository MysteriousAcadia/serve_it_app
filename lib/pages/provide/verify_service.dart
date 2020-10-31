import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:expandable/expandable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search_widget/search_widget.dart';
import 'package:serveit/blocs/request_service_bloc/request_service_bloc.dart';
import 'package:serveit/blocs/verify_service_bloc/verify_service_bloc.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/utils/constants.dart';
import 'package:serveit/models/service.dart';

class VerifyServicePage extends StatelessWidget {
  final Service service;
  File file;
  VerifyServiceBloc verifyServiceBloc;
  VerifyServicePage(this.service);
  @override
  Widget build(BuildContext context) {
    verifyServiceBloc = BlocProvider.of<VerifyServiceBloc>(context);
    Future getImage() async {
      FilePickerResult result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        // allowedExtensions: ['jpg', 'pdf', 'doc'],
      );
      if (result != null) {
        file = File(result.files.single.path);
        verifyServiceBloc.add(AddDocumentEvent(file));
      }
    }

    Widget addFileButton =
        IconButton(icon: Icon(Icons.add_circle), onPressed: getImage);

    Widget button = Button(
      "Verify Now",
      Constants.white,
      Constants.buttonTextStyle,
      () {
        verifyServiceBloc.add(UploadDocumentEvent(service.id));
      },
    );
    Widget body = BlocBuilder<VerifyServiceBloc, VerifyServiceState>(
      builder: (context, state) {
        if (state is VerifyServiceInitial) {
          return addFileButton;
        } else if (state is VerifyServiceFileAdded) {
          return button;
        } else if (state is VerifyServiceSuccess) {
          return Center(child:Text("Documents Submitted for Verification"),);
        }
      },
    );

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'Verify your skills',
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
                'Cerifications',
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
