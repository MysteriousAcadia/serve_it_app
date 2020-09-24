part of 'settings_bloc_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class GetSettingsEvent extends SettingsEvent {}

class UpdateReceiveEvent extends SettingsEvent {
  final bool value;
  UpdateReceiveEvent({@required this.value}) {
  
  }
}
class UpdateProvideEvent extends SettingsEvent {
  final bool value;
  UpdateProvideEvent({@required this.value}) {
  
  }
}
