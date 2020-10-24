import 'package:serveit/models/profile.dart';
import 'package:serveit/models/service.dart';
import 'package:serveit/models/service_question.dart';

class ServiceProvider {
  String name;
  DateTime time;
  Profile user;
  Service service;
  String serviceID;
  int status;
  String id;
  String rate;
  List<ServiceQuestion> answers;
  ServiceProvider.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = DateTime.parse(json['createdAt']);
    var _answers = (json['answers'] as List);
    if (_answers != null) {
      answers = _answers.map((e) => ServiceQuestion.fromJson(e)).toList();
    } else {
      answers = [];
    }
    id = json['id'];
    user = Profile.fromJson(json['provider'] == null ? {} : json['provider']);
    serviceID = json['service_id'];
    rate = json['rate'];
  }
}
