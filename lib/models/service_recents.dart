import 'dart:convert';

import 'package:serveit/models/profile.dart';
import 'package:serveit/models/service.dart';
import 'package:serveit/models/service_question.dart';

class ServiceRecents {
  String name;
  DateTime time;
  Profile user;
  String serviceID;
  Service service;
  int status;
  String id;
  List<ServiceQuestion> answers;
  ServiceRecents.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = DateTime.parse(json['created_at']);
    service = Service.fromJson(json['service']);
    status = json['status'];

    print("THE CURRNET" + json.toString());
    // var _answers = json["answers"] as List;
    // if (_answers != null) {
    // answers = _answers.map((e) => ServiceQuestion.fromJson(e)).toList();
    // }
    id = json['id'];
    user = Profile.fromJson(json['provider']);
    serviceID = json['service_id'];
  }
}
