import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app_template/repository/authentication_repository.dart';
import 'package:flutter_bloc_app_template/repository/user_repository.dart';
import 'package:jwt_decode/jwt_decode.dart';
import '../../models/models.dart';


part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
          _initialize();
    on<_AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(_AuthenticationStatusChanged(status)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  Future<void> _initialize() async {
    final prefsUserData = await _userRepository.getUser();
    final authToken = prefsUserData?.accessToken;
    print('ma xac thuc: $authToken');
    if (authToken != null && isTokenValid(authToken)) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(
        AuthenticationState.authenticated(prefsUserData!)
      );
    } else {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(const AuthenticationState.unauthenticated());
    }
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }

  Future<void> _onAuthenticationStatusChanged(
    _AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
       
        final user = await _tryGetUser();
        return emit(
          user != null
              ? AuthenticationState.authenticated(user)
              : const AuthenticationState.unauthenticated(),
        );
      case AuthenticationStatus.unknown:
        return emit(const AuthenticationState.unknown());
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logOut();
  }

  Future<User?> _tryGetUser() async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }
}

bool isTokenValid(String authToken) {
  var decodedToken = Jwt.parseJwt(authToken);
  var expiryTime = decodedToken['exp'] as int;
  var currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  if (expiryTime > currentTime) {
    return true;
  } else {
    return false;
  }
}