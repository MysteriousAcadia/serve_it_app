import 'dart:convert';

import 'package:serveit/models/profile.dart';
import 'package:serveit/models/service.dart';
import 'package:serveit/models/service_question.dart';
import 'package:serveit/models/user.dart';

class ServiceRecents {
  String name;
  DateTime time;
  Profile user;
  String serviceID;
  Service service;
  int status;
  String id;
  List<ServiceQuestion> answers;
  User receiver;
  User provider;
  ServiceRecents.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = DateTime.parse(json['created_at']);
    service = Service.fromJson(json['service']);
    status = json['status'];
    receiver =json['receiver']!=null?User.fromJson(json['receiver']):null;
    provider = json['provider']!=null?User.fromJson(json['provider']):null;
    print("THE CURRNET" + json.toString());
    // var _answers = json["answers"] as List;
    // if (_answers != null) {
    // answers = _answers.map((e) => ServiceQuestion.fromJson(e)).toList();
    // }
    id = json['id'];
    serviceID = json['service_id'];
  }
}
