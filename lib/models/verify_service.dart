import 'package:serveit/models/profile.dart';
import 'package:serveit/models/service.dart';
import 'package:serveit/models/service_question.dart';

//TO BE IMPLEMENTED
class VerifyService {
  final String serviceID;
  final String id;
  final int status;
  final Service service;
  final dynamic docs;
  VerifyService.fromJson(Map<String, dynamic> json):
    serviceID = json['service_id'],
    id = json['id'],
    docs = json['docs'],
    status = json['status'],
    service = Service.fromJson(json['service']);
  
}
