import 'package:serveit/models/service.dart';
import 'package:serveit/models/verify_service.dart';

class ServicesPrResponse {
  bool success;
  List<VerifyService> services;

  ServicesPrResponse({this.success, this.services});

  ServicesPrResponse.fromJson(Map<String, dynamic> json) {
    this.success = json['success'];
    var _services = json['services'] as List;
    services = _services.map((e) => VerifyService.fromJson(e)).toList();
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
