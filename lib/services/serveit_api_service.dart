import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:serveit/models/request/get_token_body.dart';
import 'package:serveit/models/request/request_service.dart';
import 'package:serveit/models/request/update_profile_body.dart';
import 'package:serveit/models/response/services_response.dart';
import 'package:serveit/models/response/token_response.dart';
import 'package:serveit/models/service.dart';

class UserApiClient {
  final _baseUrl = 'https://serve-it.herokuapp.com/api/v1';
  final http.Client httpClient;

  UserApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);
  //GET Requests
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

  Future<List<Service>> getServices(String token) async {
    final url = '$_baseUrl/services';
    final response = await this.httpClient.get(
      url,
      headers: {"token": token},
    );
    final json = jsonDecode(response.body);
    print(json);
    return ServicesResponse.fromJson(json).services;
  }

  Future<http.Response> updateProfile(
      UpdateProfileBody body, String token) async {
    final url = '$_baseUrl/update';
    final response = await this
        .httpClient
        .post(url, headers: {"token": token}, body: body.toJson());
    print(response.statusCode);
    print(response.body);
    return response;
  }

  Future<http.Response> requestService(
    RequestServiceBody body,
    String token,
  ) async {
    final url = '$_baseUrl/request';
    final response = await this.httpClient.post(
          url,
          headers: {"token": token},
          body: body.toJson(),
        );
    print(response.statusCode);
    print(response.body);
    return response;
  }
}
