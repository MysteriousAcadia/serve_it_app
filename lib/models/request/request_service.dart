import 'dart:convert';

import 'package:serveit/models/service_question.dart';

class RequestServiceBody {
  final String service_id;
  final List<ServiceQuestion> answers;

  RequestServiceBody(this.service_id, this.answers);

  Map<String, dynamic> toJson() {
    print("Came here");
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.service_id;
    data['answers'] = this.answers != null
        ? this.answers.map((e) => e.toJson()).toList().toString()
        : [];
    print(data['answers']);
    return data;
  }

  @override
  String toString() =>
      'LoginBody { service_id: $service_id, answers: $answers,  }';
}
