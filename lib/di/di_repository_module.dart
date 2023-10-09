import 'package:flutter_bloc_app_template/data/local/user_storage.dart';
import 'package:flutter_bloc_app_template/data/theme_storage.dart';
import 'package:flutter_bloc_app_template/repository/authentication_repository.dart';
import 'package:flutter_bloc_app_template/repository/theme_repository.dart';
import 'package:flutter_bloc_app_template/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RepositoryModule {
  @factoryMethod
  ThemeRepository provideAccidentsRepository(ThemeStorage themeStorage) {
    return ThemeRepositoryImpl(themeStorage);
  }

  @factoryMethod
  UserRepository provideUserRepository(UserStorage userStorage) {
    return UserRepositoryImpl(userStorage);
  }

  @factoryMethod
  AuthenticationRepository provideAuthenticationRepository(UserStorage userStorage)
  {
    return AuthenticationRepository(userStorage);
  }
}
