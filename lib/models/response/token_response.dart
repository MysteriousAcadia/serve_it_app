import 'package:serveit/models/community.dart';

class Token {
  final bool success;
  final String token;
  final bool newUser;
  final int role;
  final bool verified;
  final List<Community> communities;
  final Community currentCommunity;

  const Token(this.role, this.verified, this.communities, this.currentCommunity,
      {this.success, this.token, this.newUser});

  Token.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        token = json['authToken'],
        newUser = json['newUser'],
        role = json['role'],
        verified = json['verified'],
        currentCommunity = json['default_community'],
        communities = (json['communities'] as List)
            .map((e) => Community.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['authToken'] = this.token;
    data['newUser'] = this.newUser;
    return data;
  }

  @override
  String toString() => 'Token { token: $token }';
}
