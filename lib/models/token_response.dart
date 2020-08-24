import 'package:equatable/equatable.dart';

class Token extends Equatable {
  final bool success;
  final String token;
  final bool newUser;

  const Token({this.success, this.token, this.newUser});

  @override
  List<Object> get props => [success, token, newUser];

  static Token fromJson(dynamic json) {
    return Token(
      success: json['success'],
      token: json['authToken'],
      newUser: json['newUser'],
    );
  }

  @override
  String toString() => 'Token { token: $token }';
}