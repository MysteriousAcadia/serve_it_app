
class Token {
  final bool success;
  final String token;
  final bool newUser;

  const Token({this.success, this.token, this.newUser});

  Token.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        token = json['authToken'],
        newUser = json['newUser'];

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
