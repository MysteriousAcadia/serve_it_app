import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:serveit/models/settings.dart';
import 'package:serveit/services/localstorage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_bloc_event.dart';
part 'settings_bloc_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsLoading());
  LocalStorageService localStorageService;
  void init(LocalStorageService localStorageService) {
    this.localStorageService = localStorageService;
  }

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    try {
      yield SettingsLoading();
      Settings settings = Settings();

      settings = localStorageService.settings;

      if (event is GetSettingsEvent) {
        yield SettingsLoaded(settings: settings);
      } else if (event is UpdateProvideEvent) {
        settings.isProvideServicesEnabled = event.value;
        localStorageService.settings = settings;
        yield SettingsLoaded(settings: settings);
      } else if (event is UpdateReceiveEvent) {
        settings.isReceiveServicesEnabled = event.value;
        localStorageService.settings = settings;
        // settings.isReceiveServicesEnabled = event.value;
        // _preferences.setBool("receive", event.value);
        yield SettingsLoaded(settings: settings);
      }
    } catch (e) {
      print(e);
      print("SOmethings def wrong");
    }
    // TODO: implement mapEventToState
  }
}
