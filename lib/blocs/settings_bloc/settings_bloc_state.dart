part of 'settings_bloc_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsLoaded extends SettingsState {
  Settings settings;
  SettingsLoaded({@required this.settings});
}

class SettingsLoading extends SettingsState {}
