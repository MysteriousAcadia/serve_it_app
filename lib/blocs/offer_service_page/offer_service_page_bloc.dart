import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serveit/services/localstorage_service.dart';
import 'package:path/path.dart' as Path;
import 'package:http/http.dart' as http;
import 'package:serveit/services/serveit_api_service.dart';

part 'offer_service_page_event.dart';
part 'offer_service_page_state.dart';

class OfferServicePageBloc
    extends Bloc<OfferServicePageEvent, OfferServicePageState> {
  LocalStorageService localStorageService;
  OfferServicePageBloc(this.localStorageService)
      : super(OfferServicePageLoading());

  @override
  Stream<OfferServicePageState> mapEventToState(
    OfferServicePageEvent event,
  ) async* {
    if (event is OfferServiceAcceptEvent) {
      yield OfferServicePageLoading();
      UserApiClient client = UserApiClient(
          httpClient: http.Client(), localStorageService: localStorageService);
      var response = await client.acceptService(event.serviceID);
      yield OfferServicePageAccepted();
    }
    else if(event is OfferServiceMarkAsDoneEvent){
       yield OfferServicePageLoading();
      UserApiClient client = UserApiClient(
          httpClient: http.Client(), localStorageService: localStorageService);
      // var response = await client.(event.serviceID);
      yield OfferServicePageAccepted();
      
    }
  }
}
