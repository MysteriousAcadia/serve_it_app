part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class OnLoginPressed extends LoginEvent {
  String loginType;
  String email, password;
  OnLoginPressed({@required this.loginType, this.email, this.password});

  @override
  // TODO: implement props
  List<Object> get props => null;
}
