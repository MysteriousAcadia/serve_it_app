import 'dart:convert';

import 'package:serveit/models/settings.dart';
import 'package:serveit/models/response/token_response.dart';
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
    return Token.fromJson(jsonDecode('{"success": true,"authToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbl9pZCI6IjQiLCJmaXJlYmFzZV9pZCI6IjkiLCJjcmVhdGVkX2F0IjoiMjAyMC0xMC0wN1QxNzowMDozMi4zNTBaIiwiaWF0IjoxNjAyMDkyODkyfQ.sAY7BoY1ainCzQqldUT8aRWhcl-M6zVQY2LMMqikWmM","newUser": true,"role": 0,"verified": false,"communities": [    {        "id": "2",        "name": "abc",        "description": "hello",        "address": {            "latitude": "9405",            "locality": "abcjdsj",            "longitude": "9405",            "any other info": "adh"        },        "user_community": {            "id": "3",            "status": 0,            "created_at": "2020-10-07T17:37:59.964Z",            "updated_at": "2020-10-07T17:37:59.964Z",            "deleted_at": null,            "createdAt": "2020-10-07T17:37:59.964Z",            "updatedAt": "2020-10-07T17:37:59.964Z",            "community_id": "2",            "login_id": "4"        }    },    {        "id": "1",        "name": "abc",        "description": "hello world",        "address": null,        "user_community": {            "id": "4",            "status": 0,            "created_at": "2020-10-07T17:38:57.603Z",            "updated_at": "2020-10-07T17:38:57.603Z",            "deleted_at": null,            "createdAt": "2020-10-07T17:38:57.603Z",            "updatedAt": "2020-10-07T17:38:57.603Z",            "community_id": "1",            "login_id": "4"        }    }],"default_community": {    "id": "2",    "name": "abc",    "description": "hello",    "address": {        "latitude": "9405",        "locality": "abcjdsj",        "longitude": "9405",        "any other info": "adh"    },    "user_community": {        "id": "3",        "status": 0,        "created_at": "2020-10-07T17:37:59.964Z",        "updated_at": "2020-10-07T17:37:59.964Z", "deleted_at": null, "createdAt": "2020-10-07T17:37:59.964Z", "updatedAt": "2020-10-07T17:37:59.964Z","community_id": "2","login_id": "4"}}}'));
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
