import 'package:dropdown_search/dropdown_search.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search_widget/search_widget.dart';
import 'package:serveit/blocs/request_service_bloc/request_service_bloc.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/components/question_answer.dart';
import 'package:serveit/components/recents_card.dart';
import 'package:serveit/components/services_provide_card.dart';
import 'package:serveit/models/service_recents.dart';
import 'package:serveit/services/helperService.dart';
import 'package:serveit/utils/constants.dart';
import 'package:serveit/models/request/request_service.dart';
import 'package:serveit/models/service.dart';
import 'package:serveit/models/service_question.dart';

class RequestServicePage extends StatelessWidget {
  Service service;
  bool editable = true;
  ServiceRecents serviceRecents;
  RequestServiceBloc requestServiceBloc;
  RequestServicePage({this.service, this.serviceRecents});
  @override
  Widget build(BuildContext context) {
    DateTime date;

    if (serviceRecents != null) {
      service = serviceRecents.service;
      editable = false;
      // TODO
      date = serviceRecents.time;
    }
    requestServiceBloc = BlocProvider.of<RequestServiceBloc>(context);
    TimeOfDay timeOfDay;
    _pickDate() async {
      date = await showDatePicker(
        context: context,
        lastDate: DateTime.now(),
        // TODO date format
        firstDate: DateTime(DateTime.now().day + 5),
        initialDate: DateTime.now(),
      );
      timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      date = DateTime(
        date.year,
        date.month,
        date.day,
        timeOfDay.hour,
        timeOfDay.minute,
      );
      requestServiceBloc.add(UpdateData());
      print(date.toIso8601String());
    }

    List<QuestionAnswer> questionAnswers =
        questionBuilder(service.questions, editable);

    Widget optionsCard = Container(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: const Color(0xff9eeecb),
        elevation: 5,
        shadowColor: Color(0x14000000),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 0, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Answer' + (editable ? "" : "ed") + ' Questions',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  color: const Color(0xff005c7e),
                  letterSpacing: -0.42500000000000004,
                  fontWeight: FontWeight.w700,
                  height: 1.1764705882352942,
                ),
                textAlign: TextAlign.left,
              ),
              Column(
                children: <Widget>[...questionAnswers],
              ),
            ],
          ),
        ),
      ),
    );
    Widget onDemandCard = Container(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: const Color(0xff9eeecb),
        elevation: 5,
        shadowColor: Color(0x14000000),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 0, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Text(
              //   'On Demand',
              //   style: TextStyle(
              //     fontFamily: 'Montserrat',
              //     fontSize: 20,
              //     color: const Color(0xff005c7e),
              //     letterSpacing: -0.42500000000000004,
              //     fontWeight: FontWeight.w700,
              //     height: 1.1764705882352942,
              //   ),
              //   textAlign: TextAlign.left,
              // ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  BlocBuilder<RequestServiceBloc, RequestServiceState>(
                    builder: (context, state) {
                      if (state is RequestServiceSuccess) {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          Navigator.of(context).pop();
                        });
                      }
                      return state is RequestServiceLoading
                          ? CircularProgressIndicator()
                          : Flexible(
                              flex: 1,
                              child: Button(
                                "Book Now",
                                // TODO  redirect to /payments
                                Constants.white,
                                Constants.buttonTextStyle,
                                () {
                                  RequestServiceBody body = RequestServiceBody(
                                      service.id,
                                      questionAnswers
                                          .map((e) => ServiceQuestion(
                                              question:
                                                  e.serviceQuestion.question,
                                              id: e.serviceQuestion.id,
                                              answer: e.controller.text))
                                          .toList());
                                  requestServiceBloc
                                      .add(SendRequestServiceEvent(body));
                                },
                              ),
                            );
                    },
                  ),

                  // Flexible(
                  //   flex: 1,
                  //   child: Button(
                  //     "Pay 150",
                  //     Constants.white,
                  //     Constants.buttonTextStyle,
                  //     () => {},
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );

    Widget scheduleCard = Container(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: const Color(0xff9eeecb),
        elevation: 5,
        shadowColor: Color(0x14000000),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 0, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ExpandablePanel(
                header: Text(
                  'Schedule',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: const Color(0xff005c7e),
                    letterSpacing: -0.42500000000000004,
                    fontWeight: FontWeight.w700,
                    height: 1.1764705882352942,
                  ),
                  textAlign: TextAlign.left,
                ),
                collapsed: Container(),
                expanded: Column(
                  children: <Widget>[
                    ListTile(
                      title:
                          BlocBuilder<RequestServiceBloc, RequestServiceState>(
                        builder: (context, state) {
                          return Text(date == null
                              ? "Please select a time"
                              : HelperService.getFormattedDate(date));
                        },
                      ),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      onTap: _pickDate,
                    ),
                  ],
                ),
                tapHeaderToExpand: true,
                hasIcon: true,
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                service.name,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  color: const Color(0xff606060),
                  letterSpacing: -0.675,
                  fontWeight: FontWeight.w700,
                  height: 1.1851851851851851,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            optionsCard,
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'When do you want the service?',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  color: const Color(0xff606060),
                  letterSpacing: -0.675,
                  fontWeight: FontWeight.w700,
                  height: 1.1851851851851851,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            scheduleCard,
            onDemandCard,
          ],
        ),
      ),
    );
  }

  List<QuestionAnswer> questionBuilder(
      List<ServiceQuestion> questions, bool editable) {
    List<QuestionAnswer> questionWidgets = [];
    for (int i = 0; i < questions.length; i++) {
      questionWidgets.add(QuestionAnswer(questions[i], editable));
    }
    return questionWidgets;
  }
}
