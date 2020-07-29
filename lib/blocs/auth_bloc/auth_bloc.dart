import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:serveit/repositories/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  UserRepository userRepository = UserRepository();
  AuthBloc(AuthState initialState) : super(initialState);

 

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
    else if(event is LogoutEvent){
      try{
        await userRepository.signOut();
        yield UnAuthenticated();
      }
      catch(e){
        throw Exception("Failed to Logout");
      }
    }
  }

 

  
}
