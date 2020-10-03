import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:serveit/models/request/get_token_body.dart';
import 'package:serveit/models/request/request_service.dart';
import 'package:serveit/models/request/update_profile_body.dart';
import 'package:serveit/models/response/service_provider_response.dart';
import 'package:serveit/models/response/services_response.dart';
import 'package:serveit/models/response/token_response.dart';
import 'package:serveit/models/service.dart';
import 'package:serveit/models/service_provider.dart';
import 'package:serveit/models/service_recents.dart';

class UserApiClient {
  final _baseUrl = 'https://serve-it.herokuapp.com/api/v1';
  final http.Client httpClient;

  UserApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);
  //GET Requests
  //IMPLEMENTED
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
  //IMPLEMENTED
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
  //TODO BE IMPLEMENTED PROPERLY
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
  
 
  
  //TODO: BE IMPLEMENTED
  Future<List<ServiceRecents>> getServiceRecents(String token) async{
    final url = '$_baseUrl/showServiceReceiver';
    final response = await this.httpClient.get(
      url,
      headers: {"token": token},
    );
    final json = jsonDecode(response.body);
    print(json);
    return ServicesProviderResponse.fromJson(json).services;
    
  }

  //TODO: BE IMPLEMENTED
Future<List<ServiceProvider>> getServiceProdiver(String token) async{
    final url = '$_baseUrl/showServiceProvider';
    final response = await this.httpClient.get(
      url,
      headers: {"token": token},
    );
    final json = jsonDecode(response.body);
    print(json);
    return ServicesProviderResponse.fromJson(json).services;
    
  }

  //POST REQUESTS
   //TODO: BE IMPLEMENTED
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

  //TODO: BE IMPLEMENTED
  Future<http.Response> cancelServiceReceiver(
    String requestID,
    String token,
  ) async {
    final url = '$_baseUrl/cancelServiceReciever';
    final response = await this.httpClient.post(
          url,
          headers: {"token": token},
          body: {"request_id":requestID},
        );
    print(response.statusCode);
    print(response.body);
    return response;
  }

  //TODO: BE IMPLEMENTED
  Future<http.Response> cancelServiceProvider(
    String requestID,
    String token,
  ) async {
    final url = '$_baseUrl/cancelServiceProvider';
    final response = await this.httpClient.post(
          url,
          headers: {"token": token},
          body: {"request_id":requestID},
        );
    print(response.statusCode);
    print(response.body);
    return response;
  }

}
