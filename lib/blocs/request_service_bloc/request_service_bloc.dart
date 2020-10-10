import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serveit/models/request/request_service.dart';
import 'package:serveit/services/localstorage_service.dart';
import 'package:serveit/services/serveit_api_service.dart';
import 'package:http/http.dart' as http;

part 'request_service_event.dart';
part 'request_service_state.dart';

class RequestServiceBloc
    extends Bloc<RequestServiceEvent, RequestServiceState> {
  RequestServiceBloc(this.localStorageService) : super(RequestServiceInitial());
  final LocalStorageService localStorageService;
  DateTime dateTime;

  @override
  Stream<RequestServiceState> mapEventToState(
    RequestServiceEvent event,
  ) async* {
    if (event is SendRequestServiceEvent) {
      UserApiClient client = UserApiClient(httpClient: http.Client());
      List<dynamic> responses = await Future.wait([
        client.requestService(
            event.requestServiceBody, localStorageService.authToken.token)
      ]);
    }
  }
}
