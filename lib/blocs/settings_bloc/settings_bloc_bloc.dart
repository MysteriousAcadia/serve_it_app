import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:serveit/models/settings.dart';
import 'package:serveit/services/localstorage_service.dart';

part 'settings_bloc_event.dart';
part 'settings_bloc_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsLoading());

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    try {
      yield SettingsLoading();
      Settings settings = LocalStorageService().settings;

      if (event is GetSettingsEvent) {
        yield SettingsLoaded(settings: settings);
      } else if (event is UpdateSettingsEvent) {
        LocalStorageService().settings = event.settings;
      }
    } catch (e) {}
    // TODO: implement mapEventToState
  }
}
