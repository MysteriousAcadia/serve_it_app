import 'package:serveit/models/service.dart';

class ServicesResponse {
  bool success;
  List<Service> services;

  ServicesResponse({this.success, this.services});

  ServicesResponse.fromJson(Map<String, dynamic> json) {
    this.success = json['success'];
    var _services = json['services'] as List;
    services = _services.map((e) => Service.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['services'] = this.services;
    return data;
  }

  @override
  String toString() =>
      'ServicesResponse { success: $success, services: $services }';
}
