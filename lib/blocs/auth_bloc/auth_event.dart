part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {}

class AppStartedEvent extends AuthEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;

}
class RefreshLoginToken extends AuthEvent{
   @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
class LogoutEvent extends AuthEvent{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}