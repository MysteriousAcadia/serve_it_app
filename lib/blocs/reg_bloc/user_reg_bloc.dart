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
  UserRepository userRepository = UserRepository();

  @override
  Stream<UserRegState> mapEventToState(
    UserRegEvent event,
  ) async* {
    if (event is SignupButtonPressedEvent) {
      yield UserRegLoadingState();
      try {
        var user =
            await userRepository.createNewUser(event.email, event.password);
        yield UserRegSuccessfulState(user: user);
      } catch (e) {
        yield UserRegUnSuccessfulState(message: "null");
      }
    }
  }
}
