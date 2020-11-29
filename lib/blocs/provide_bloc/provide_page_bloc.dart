import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serveit/models/service.dart';
import 'package:serveit/models/service_recents.dart';
import 'package:serveit/models/verify_service.dart';
import 'package:serveit/services/localstorage_service.dart';
import 'package:serveit/services/serveit_api_service.dart';
import 'package:http/http.dart' as http;

part 'provide_page_event.dart';
part 'provide_page_state.dart';

class ProvidePageBloc extends Bloc<ProvidePageEvent, ProvidePageState> {
  final LocalStorageService localStorageService;
  ProvidePageBloc(this.localStorageService) : super(ProvidePageInitial());

  @override
  Stream<ProvidePageState> mapEventToState(
    ProvidePageEvent event,
  ) async* {
    if (event is ProvidePageReload) {
      yield ProvidePageLoading();
      UserApiClient client = UserApiClient(
          httpClient: http.Client(), localStorageService: localStorageService);
      List<dynamic> responses = await Future.wait([
        client.getProviderServices(localStorageService.authToken.token),
        client.getServiceProvider(localStorageService.authToken.token),
        client.serviceOffers(localStorageService.authToken.token),
      ]);
       print("WHOTaaa" +
          responses[0].length.toString() +
          responses[1].length.toString() +
          responses[2].length.toString());
      // yield (ProvidePageSuccess(responses[0], responses[0],responses[0]));
      yield (ProvidePageSuccess(responses[0], responses[1], responses[2]));
    }
  }
}
