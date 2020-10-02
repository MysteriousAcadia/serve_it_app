import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serveit/models/service.dart';
import 'package:serveit/services/localstorage_service.dart';
import 'package:serveit/services/serveit_api_service.dart';
import 'package:http/http.dart' as http;

part 'receive_page_event.dart';
part 'receive_page_state.dart';

class ReceivePageBloc extends Bloc<ReceivePageEvent, ReceivePageState> {
  ReceivePageBloc() : super(ReceivePageInitial());
  LocalStorageService localStorageService;
  void init(LocalStorageService localStorageService) {
    this.localStorageService = localStorageService;
  }

  @override
  Stream<ReceivePageState> mapEventToState(
    ReceivePageEvent event,
  ) async* {
    if (event is ReceivePageReload) {
      yield ReceivePageLoading();
      UserApiClient client = UserApiClient(httpClient: http.Client());
      List<dynamic> responses = await Future.wait(
          [client.getServices(localStorageService.authToken.token)]);
      yield (ReceivePageSuccess(responses[0], responses[0]));
    }
  }
}
