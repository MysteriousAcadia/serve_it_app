import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serveit/models/community.dart';
import 'package:http/http.dart' as http;
import 'package:serveit/services/localstorage_service.dart';
import 'package:serveit/services/serveit_api_service.dart';

part 'select_community_event.dart';
part 'select_community_state.dart';

class SelectCommunityBloc
    extends Bloc<SelectCommunityEvent, SelectCommunityState> {
  SelectCommunityBloc(this.localStorageService)
      : super(SelectCommunityInitial());

  final LocalStorageService localStorageService;
  List<Community> communities;

  @override
  Stream<SelectCommunityState> mapEventToState(
    SelectCommunityEvent event,
  ) async* {
    if (event is FetchCommunitiesEvent) {
      yield (SelectCommunityLoading());
      UserApiClient client = UserApiClient(httpClient: http.Client());
      communities = await client.getCommunities(
          this.localStorageService.authToken.token, event.query);
      yield (SelectCommunityLoaded(communities));
    } else if (event is AddCommunityEvent) {
      UserApiClient client = UserApiClient(httpClient: http.Client());
      await client.joinCommunity(
          event.community_id, this.localStorageService.authToken.token, "HH");
      yield (SelectCommunitySuccess());
    }
  }
}
