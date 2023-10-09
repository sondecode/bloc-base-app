import 'dart:async';

import 'package:flutter_bloc_app_template/data/local/user_storage.dart';

import '../models/models.dart';

abstract class UserRepository {
  Future<User?> getUser();

  Future<void> saveUserAndToken(User user);

  Future<void> logOut();
}
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userStorage);
  final UserStorage _userStorage;
  User? _user;

  @override
  Future<void> saveUserAndToken(User user) async {
    await _userStorage.saveUserAndToken(user);
  }

  // @override
  // Future<User?> getUser() async {
  //   // print('123');
  //   return const User(id: '123123', name: 'test', email: 'test2@gmail.com', access_token: 'eqrefsdf 32423 r ewfdsfsd', photo: 'https://picsum.photos/200/300');
  // }

  @override
  Future<User?> getUser() async {
  if (_user != null) return _user;
  var user = await _userStorage.getUserData();
  if (user != User.empty) {
    _user = user;
  }
  return _user;
  }

  @override
  Future<void> logOut() async {
    await _userStorage.clearUserData();
  }
}