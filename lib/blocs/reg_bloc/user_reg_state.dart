part of 'user_reg_bloc.dart';

abstract class UserRegState extends Equatable {
  const UserRegState();
}

class UserRegInitial extends UserRegState {
  @override
  List<Object> get props => [];
}

class UserRegLoadingState extends UserRegState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class UserRegSuccessfulState extends UserRegState {
  FirebaseUser user;

  UserRegSuccessfulState({@required this.user});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class UserRegUnSuccessfulState extends UserRegState {
  String message;
  String emailError;
  String passwordError;
  String passwordRepeatError;
  bool validateEmail = false;
  bool validatePassword = false;
  bool passwordRepeat = false;
  UserRegUnSuccessfulState({@required this.message});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
