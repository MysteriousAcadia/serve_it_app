
import 'package:serveit/models/service.dart';

class ServicesResponse {
  final bool success;
  final List<Service> services;

  const ServicesResponse({this.success, this.services});

  ServicesResponse.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        services = json['services'] as List;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['services'] = this.services;
    return data;
  }

  @override
  String toString() => 'ServicesResponse { success: $success, services: $services }';
}
