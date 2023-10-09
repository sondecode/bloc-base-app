import 'dart:async';

import 'package:flutter_bloc_app_template/data/local/user_storage.dart';
import 'package:flutter_bloc_app_template/models/user.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository(this._userStorage);
  final UserStorage _userStorage;
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn(User user) async {
    // var token = await getToken(username, password);
    try{
      await _userStorage.saveUserAndToken(user);
      _controller.add(AuthenticationStatus.authenticated);
    }
    catch(e){
      throw Exception('Login failed');
    }
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}
