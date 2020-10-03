import 'package:serveit/models/service.dart';
import 'package:serveit/models/service_provider.dart';
import 'package:serveit/models/service_recents.dart';

class ServicesProviderResponse {
  bool success;
  List<ServiceProvider> services;

  ServicesProviderResponse({this.success, this.services});

  ServicesProviderResponse.fromJson(Map<String, dynamic> json) {
    this.success = json['success'];
    var _services = json['request'] as List;
    services = _services.map((e) => ServiceProvider.fromJson(e)).toList();
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
