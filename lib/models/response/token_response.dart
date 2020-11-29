import 'dart:convert';

import 'package:serveit/models/community.dart';

class Token {
  final bool success;
  final String token;
  final bool newUser;
  final int role;
  final int verified;
  final List<Community> communities;
  final Community currentCommunity;

   Token.none():
    this.success = false,
    this.newUser = true,
    this.role = -1,
    this.verified = -1,
    this.communities = [],
    this.currentCommunity = Community(),
    this.token = "";

  const Token({this.role, this.verified, this.communities, this.currentCommunity,
      this.success, this.token, this.newUser});

  Token.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        token = json['authToken'],
        newUser = json['newUser'],
        role = json['role'],
        // verified = json['verified'],
        verified = 1,
        currentCommunity = Community.fromJson(json['default_community']),
        communities = (json['communities'] as List == null
                ? []
                : json['communities'] as List)
            .map((e) => Community.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['authToken'] = this.token;
    data['newUser'] = this.newUser;
    data['role'] = this.role;
    data['verified'] = this.verified;
    data['default_community'] = this.currentCommunity.toJson();
    data['communities'] = (this.communities.map((e) => e.toJson()).toList());
    return data;
  }

  @override
  String toString() => 'Token { token: $token }';
}
