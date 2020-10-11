import 'package:serveit/models/community.dart';
import 'package:serveit/models/service.dart';
import 'package:serveit/models/service_provider.dart';
import 'package:serveit/models/service_recents.dart';

class CommunitiesResponse {
  bool success;
  List<Community> communities;

  CommunitiesResponse({this.success, this.communities});

  CommunitiesResponse.fromJson(Map<String, dynamic> json) {
    this.success = json['success'];
    var _services = json['communities'] as List;
    communities = _services.map((e) => Community.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['communities'] = this.communities;
    return data;
  }

  @override
  String toString() =>
      'ServicesResponse { success: $success, services: $communities }';
}
