part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

 class AuthenticatedState extends AuthState {
  FirebaseUser user;
  AuthenticatedState({@required this.user});

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class UnAuthenticated extends AuthState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
class NewUserState extends AuthState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
class UnverifiedState extends AuthState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
