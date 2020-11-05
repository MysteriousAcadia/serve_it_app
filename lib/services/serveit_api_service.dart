import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:serveit/models/community.dart';
import 'package:serveit/models/request/get_token_body.dart';
import 'package:serveit/models/request/request_service.dart';
import 'package:serveit/models/request/update_profile_body.dart';
import 'package:serveit/models/response/communities_response.dart';
import 'package:serveit/models/response/service_provider_response.dart';
import 'package:serveit/models/response/service_recents_response.dart';
import 'package:serveit/models/response/services_response.dart';
import 'package:serveit/models/response/token_response.dart';
import 'package:serveit/models/service.dart';
import 'package:serveit/models/service_provider.dart';
import 'package:serveit/models/service_recents.dart';
import 'package:serveit/repositories/user_repository.dart';
import 'package:serveit/services/localstorage_service.dart';

class UserApiClient {
  final _baseUrl = 'https://serve-it.herokuapp.com/api/v1';
  final http.Client httpClient;
  final LocalStorageService localStorageService;
  UserApiClient({@required this.httpClient, @required this.localStorageService})
      : assert(httpClient != null);
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

  Future<List<Community>> getCommunities(String token, String query) async {
    final url = '$_baseUrl/showCommunities';
    final response = await this.httpClient.get(
      url,
      headers: {
        "token": token,
        "query": query,
      },
    );
    final json = jsonDecode(response.body);
    print(json);
    return CommunitiesResponse.fromJson(json).communities;
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
    print(body.toJson());
    final response = await this
        .httpClient
        .post(url, headers: {"token": token}, body: jsonEncode(body.toJson()));
    if (response.statusCode != 200) {
      print(response.body);
      throw new Exception("Something went Wrong, please try again");
    }
    print(response.body);

    return response;
  }

  //TODO: BE IMPLEMENTED
  Future<List<ServiceRecents>> getServiceRecents(String token) async {
    final url = '$_baseUrl/showServiceReciever';
    final response = await this.httpClient.get(
      url,
      headers: {"token": token},
    );
    final json = jsonDecode(response.body);
    print(json);
    return ServicesRecentsResponse.fromJson(json).services;
  }

  //TODO: BE IMPLEMENTED
  //SCHEDULED
  Future<List<ServiceProvider>> getServiceProvider(String token) async {
    final url = '$_baseUrl/showServiceProvider';
    final response = await this.httpClient.get(
      url,
      headers: {"token": token},
    );
    final json = jsonDecode(response.body);
    print(json);
    return ServicesProviderResponse.fromJson(json).services;
  }

  //LIST of services
  Future<List<ServiceProvider>> getProviderServices(String token) async {
    final url = '$_baseUrl/providerServices';
    final response = await this.httpClient.get(
      url,
      headers: {"token": token},
    );
    final json = jsonDecode(response.body);
    print(json);
    return ServicesProviderResponse.fromJson(json).services;
  }

  //LIST OF OFFERS
  Future<List<ServiceProvider>> serviceOffers(String token) async {
    final url = '$_baseUrl/availableNow';
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
      body: {"request_id": jsonEncode(requestID)},
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
      body: {"request_id": requestID},
    );
    print(response.statusCode);
    print(response.body);
    return response;
  }

  Future<http.Response> joinCommunity(
    String community_id,
    String token,
    String doc,
  ) async {
    final url = '$_baseUrl/joinCommunity';
    var response = await this.httpClient.post(
      url,
      headers: {"token": token},
      body: {"community_id": community_id},
    );
    print(response.statusCode);
    print(response.body);
    return response;
  }

  Future<http.Response> verifyServiceDoc(
    String service_id,
    String token,
    String doc,
  ) async {
    final url = '$_baseUrl/joinServices';
    var response = await this.httpClient.post(
      url,
      headers: {"token": token},
      body: {
        "service_id": service_id,
        "doc": jsonEncode({"doc": doc})
      },
    );
    print(response.statusCode);
    print(response.body);
    return response;
  }

  Future<http.Response> acceptService(String serviceID) async {
    final url = '$_baseUrl/accept';
    var response = await this.httpClient.post(
      url,
      headers: {"token": localStorageService.authToken.token},
      body: {
        "request_id": serviceID,
      },
    );
    print(response.statusCode);
    print(response.body);
    return response;
  }

  Future<http.Response> markAsDone(String serviceID) async {
    final url = '$_baseUrl/done';
    var response = await this.httpClient.post(
      url,
      headers: {"token": localStorageService.authToken.token},
      body: {
        "request_id": serviceID,
      },
    );
    print(response.statusCode);
    print(response.body);
    return response;
  }
}
