import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:serveit/models/community.dart';
import 'package:serveit/models/response/token_response.dart';
import 'package:serveit/repositories/user_repository.dart';
import 'package:serveit/services/localstorage_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;
  final LocalStorageService localStorageService;

  AuthBloc(
      AuthState initialState, this.userRepository, this.localStorageService)
      : super(initialState);

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      try {
        bool isSignedIn = await userRepository.isSignedIn();
        if (!isSignedIn) {
          yield UnAuthenticated();
          return;
        }
        Token token = await userRepository.getAuthToken();
        if (token.newUser) {
          yield NewUserState();
          return;
        } else if (token.currentCommunity == null) {
          yield NoCommunityState();
          return;
        } else if (token.verified == 1) {
          yield UnverifiedState(token.currentCommunity);
          return;
        }
        else{
        yield AuthenticatedState(user: await userRepository.getCurrentUser());

        }
      } catch (e) {
        print('this was error');
        print(e.toString());
        print(localStorageService.authToken);
        yield ErrorState();
      }
    } else if (event is LogoutEvent) {
      try {
        await userRepository.signOut();
        yield UnAuthenticated();
      } catch (e) {
        throw Exception("Failed to Logout");
      }
    } else if (event is RefreshLoginToken) {
      var isSignedIn = await userRepository.isSignedIn();
      if (isSignedIn) {
        yield AuthenticatedState(user: await userRepository.getCurrentUser());
      } else {
        yield UnAuthenticated();
      }
    }
  }
}
