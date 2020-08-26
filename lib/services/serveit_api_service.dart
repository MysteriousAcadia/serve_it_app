import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:serveit/models/get_token_body.dart';
import 'package:serveit/models/token_response.dart';

class UserApiClient {
  final _baseUrl = 'https://serve-it.herokuapp.com/api/v1';
  final http.Client httpClient;

  UserApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Token> getToken(String uid) async {
    final url = '$_baseUrl/login';
    LoginBody body = LoginBody(id: uid);
    print(body);
    final response = await this.httpClient.post(url, body: body.toJson());
    print(response.statusCode);
    print(response.body);

    final json = jsonDecode(response.body);
    return Token.fromJson(json);
  }
}
