import 'package:serveit/models/service_question.dart';

class Service {
  String name;
  String description;
  String id;
  List<ServiceQuestion> questions;
  Service({this.name, this.description, this.id, this.questions});
  Service.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    var _questions = (json['questions'] as List);
    print(_questions);
    if (_questions != null) {
      questions = _questions.map((e) => ServiceQuestion.fromJson(e)).toList();
    }
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['id'] = this.id;
    data['questions'] = this.questions;
    return data;
  }
}
