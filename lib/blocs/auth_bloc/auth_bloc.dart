import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:serveit/models/community.dart';
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
        var isSignedIn = await userRepository.isSignedIn();
        // var isNewUser = localStorageService.authToken.newUser;
        // var isVerified = localStorageService.authToken.verified;
        // var community = localStorageService.authToken.currentCommunity;
        yield AuthenticatedState(
                user: await userRepository.getCurrentUser());
        // if (isSignedIn) {
        //   if (isNewUser) {
        //     yield NewUserState();
        //   } else if (community == null) {
        //     yield NoCommunityState();
        //   } else if (isVerified <= 0) {
        //     yield UnverifiedState(community);
        //   } else {
            
        //   }
        // } else {
        //   print('this was?? error');

        //   yield UnAuthenticated();
        // }
      } catch (e) {
        print('this was error');
        print(e.toString());
        print(localStorageService.authToken);
        yield UnAuthenticated();
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
