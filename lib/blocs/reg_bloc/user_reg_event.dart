part of 'user_reg_bloc.dart';

abstract class UserRegEvent extends Equatable {
  const UserRegEvent();
}

class SignupButtonPressedEvent extends UserRegEvent {
  String loginType;
  String email, password;


  SignupButtonPressedEvent(
      {@required this.loginType,  this.email,  this.password});
  @override
  // TODO: implement props
  List<Object> get props => null;
}
