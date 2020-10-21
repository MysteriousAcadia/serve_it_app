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
import 'package:serveit/utils/constants.dart';
import 'package:serveit/models/service.dart';

class VerifyWaitingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: 
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'Please wait while we verify your profile',
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
        ),
      ),
    );
  }
}
