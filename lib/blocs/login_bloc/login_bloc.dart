import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:serveit/repositories/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;
  LoginBloc() : super(LoginInitial());

  void init(UserRepository userRepository) {
    this.userRepository = userRepository;
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is OnLoginEvent) {
      yield LoginLoadingState();
      try {
        if (event.loginType == 'EMAIL') {
          var user =
              await userRepository.signInWithEmail(event.email, event.password);
        } else if (event.loginType == 'GOOGLE') {
          print("reached here");
          var user = await userRepository.signInWithGoogle();
          print(user);
        } else if (event.loginType == 'FACEBOOK') {
          var user = await userRepository.signInWithFacebook();
        }
        yield LoginSuccessState();
      } on PlatformException catch (error) {
        print("catch Exception");

        print(error);
        yield LoginFailureState(message: error.toString());
      } catch (error) {
        String errorMessage;
        print("catch Exception");
        print(error);
        // switch (error.code) {
        //   case "ERROR_INVALID_EMAIL":
        //     errorMessage = "Your email address appears to be malformed.";
        //     break;
        //   case "ERROR_WRONG_PASSWORD":
        //     errorMessage = "Your password is wrong.";
        //     break;
        //   case "ERROR_USER_NOT_FOUND":
        //     errorMessage = "User with this email doesn't exist.";
        //     break;
        //   case "ERROR_USER_DISABLED":
        //     errorMessage = "User with this email has been disabled.";
        //     break;
        //   case "ERROR_TOO_MANY_REQUESTS":
        //     errorMessage = "Too many requests. Try again later.";
        //     break;
        //   case "ERROR_OPERATION_NOT_ALLOWED":
        //     errorMessage = "Signing in with Email and Password is not enabled.";
        //     break;
        //   default:
        //     errorMessage = "An undefined Error happened.";
        // }
        yield LoginFailureState(message: errorMessage);
      }
    }
  }
}
