import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:serveit/models/user.dart';
class LocalStorageService {
  static const String UserKey = 'user';
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
    saveStringToDisk(UserKey, jsonEncode(userToSave.toJson()));
  }
  dynamic _getFromDisk(String key) {
    var value  = _preferences.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }
  void saveStringToDisk(String key, String content){
    print('(TRACE) LocalStorageService:_saveStringToDisk. key: $key value: $content');
    _preferences.setString(UserKey, content);
  }
}