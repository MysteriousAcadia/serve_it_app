import 'dart:convert';

import 'package:serveit/models/settings.dart';
import 'package:serveit/models/token_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:serveit/models/user.dart';

class LocalStorageService {
  //KEYS
  static const String UserKey = 'user';
  static const String SettingsKey = 'settings';
  static const String AuthTokenKey = 'auth_token_key';
  
  static LocalStorageService _instance;
  static SharedPreferences _preferences;
  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  User get user {
    var userJson = _getFromDisk(UserKey);
    if (userJson == null) {
      return null;
    }
    return User.fromJson(jsonDecode(userJson));
  }

  set user(User userToSave) {
    _saveStringToDisk(UserKey, jsonEncode(userToSave.toJson()));
  }

Token get authToken {
    var authToken = _getFromDisk(AuthTokenKey);
    if (authToken == null) {
      return null;
    }
    return Token.fromJson(jsonDecode(authToken));
  }

  set authToken(Token token) {
    _saveStringToDisk(AuthTokenKey, jsonEncode(token.toJson()));
  }

  

  Settings get settings {
    var settingsJson = _getFromDisk(SettingsKey);
    if (settingsJson == null) {
      settings = Settings();
      return settings;
    }
    return Settings.fromJson(jsonDecode(settingsJson));
  }

  set settings(Settings settingsToSave) {
    _saveStringToDisk(SettingsKey, jsonEncode(settingsToSave.toJson()));
  }


  void _saveStringToDisk(String key, String content) async {
    print(
        '(TRACE) LocalStorageService:_saveStringToDisk. key: $key value: $content');
    await _preferences.setString(key, content);
  }
  dynamic _getFromDisk(String key) {
    var value = _preferences.getString(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }


}
