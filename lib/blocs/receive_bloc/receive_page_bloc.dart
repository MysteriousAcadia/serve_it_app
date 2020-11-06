import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serveit/models/service.dart';
import 'package:serveit/models/service_recents.dart';
import 'package:serveit/services/localstorage_service.dart';
import 'package:serveit/services/serveit_api_service.dart';
import 'package:http/http.dart' as http;

part 'receive_page_event.dart';
part 'receive_page_state.dart';

class ReceivePageBloc extends Bloc<ReceivePageEvent, ReceivePageState> {
  ReceivePageBloc(this.localStorageService) : super(ReceivePageInitial());
  final LocalStorageService localStorageService;

  @override
  Stream<ReceivePageState> mapEventToState(
    ReceivePageEvent event,
  ) async* {
    if (event is ReceivePageReload) {
      yield ReceivePageLoading();
      UserApiClient client = UserApiClient(httpClient: http.Client(), localStorageService: localStorageService);
      List<dynamic> responses = await Future.wait(
        [
          client.getServices(localStorageService.authToken.token),
          client.getServiceRecents(localStorageService.authToken.token),
        ],
      );
      yield (ReceivePageSuccess(responses[0], responses[1]));
    }
  }
}
