part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => null;
}

class LoginSuccessState extends LoginState {
  @override
  List<Object> get props => null;
}

class LoginFailureState extends LoginState {
  String message;
  LoginFailureState({@required this.message});
  @override
  List<Object> get props => null;
}
