import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:serveit/repositories/user_repository.dart';

part 'user_reg_event.dart';
part 'user_reg_state.dart';

class UserRegBloc extends Bloc<UserRegEvent, UserRegState> {
  UserRegBloc() : super(UserRegInitial());
  UserRepository userRepository;
  void init(UserRepository userRepository) {
    this.userRepository = userRepository;
  }

  @override
  Stream<UserRegState> mapEventToState(
    UserRegEvent event,
  ) async* {
    if (event is SignupButtonPressedEvent) {
      yield UserRegLoadingState();
      try {
        var user;
        if (event.loginType == 'EMAIL') {
          user =
              await userRepository.createNewUser(event.email, event.password);
        } else if (event.loginType == 'GOOGLE') {
          user = await userRepository.signInWithGoogle();
        } else if (event.loginType == 'FACEBOOK') {
          user = await userRepository.signInWithFacebook();
        }
        yield UserRegSuccessfulState(user: user);
      } catch (e) {
        yield UserRegUnSuccessfulState(message: "null");
      }
    }
  }
}
