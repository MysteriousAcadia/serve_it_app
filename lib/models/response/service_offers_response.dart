import 'package:serveit/models/service.dart';
import 'package:serveit/models/service_recents.dart';

class ServiceOffersResponse {
  bool success;
  List<ServiceRecents> services;

  ServiceOffersResponse({this.success, this.services});

  ServiceOffersResponse.fromJson(Map<String, dynamic> json) {
    this.success = json['success'];
    var _services = json['services'] as List;
    services = _services.map((e) => ServiceRecents.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['request'] = this.services;
    return data;
  }

  @override
  String toString() =>
      'ServicesResponse { success: $success, services: $services }';
}
