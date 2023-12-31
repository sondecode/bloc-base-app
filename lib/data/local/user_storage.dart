import 'dart:convert';

import 'package:flutter_bloc_app_template/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserStorage {
  Future<void> saveUserAndToken(User user);

  Future<User> getUserData();

  Future<void> clearUserData();
}

class SharedPreferencesUserStorage implements UserStorage {
  SharedPreferencesUserStorage(this.sharedPreferences);

  static const String _userData = '';

  final SharedPreferences sharedPreferences;

  @override
  Future<User> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString(_userData) ?? '';
    if (userData != '') {
      return User.fromJson(jsonDecode(userData));
    }
    else{
      return User.empty;
    }
  }

  @override
  Future<void> saveUserAndToken(User user) async {
    // print('res:'+user.toString());
    var toBeSaved = jsonEncode(user.toJson());
    print('encode:$toBeSaved');
    await sharedPreferences.setString(_userData, toBeSaved);
  }

  @override
  Future<void> clearUserData() async {
    await sharedPreferences.remove(_userData);
  }
}
