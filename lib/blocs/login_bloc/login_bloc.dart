import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:serveit/repositories/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository = UserRepository();
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is OnLoginPressed) {
      yield LoginLoadingState();
      try {
        var user =
            await userRepository.signInWithEmail(event.email, event.password);
        print(user.toString());
        yield LoginSuccessState();
      } catch (e) {
        print(e.toString());
        yield LoginFailureState(message: e.toString());
      }
    }
  }
}
