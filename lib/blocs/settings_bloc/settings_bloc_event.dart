part of 'settings_bloc_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class GetSettingsEvent extends SettingsEvent {}

class UpdateSettingsEvent extends SettingsEvent {
  Settings settings;
  UpdateSettingsEvent({@required this.settings}){

  }
}
