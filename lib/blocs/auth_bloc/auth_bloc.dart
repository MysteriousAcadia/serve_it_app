import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:serveit/repositories/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  UserRepository userRepository;
  AuthBloc() {
    userRepository = UserRepository();
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      try {
        var isSignedIn = await userRepository.isSignedIn();
        if (isSignedIn) {
          yield AuthenticatedState(user: await userRepository.getCurrentUser());
        } else {
          yield UnAuthenticated();
        }
      } catch (e) {
        yield UnAuthenticated();
      }
    }
  }
}
