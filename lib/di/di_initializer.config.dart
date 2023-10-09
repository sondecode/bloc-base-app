// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i3;
import 'package:flutter_bloc_app_template/data/local/user_storage.dart' as _i5;
import 'package:flutter_bloc_app_template/data/theme_storage.dart' as _i4;
import 'package:flutter_bloc_app_template/di/di_app_module.dart' as _i9;
import 'package:flutter_bloc_app_template/di/di_data_module.dart' as _i10;
import 'package:flutter_bloc_app_template/di/di_repository_module.dart' as _i11;
import 'package:flutter_bloc_app_template/repository/authentication_repository.dart'
    as _i6;
import 'package:flutter_bloc_app_template/repository/theme_repository.dart'
    as _i7;
import 'package:flutter_bloc_app_template/repository/user_repository.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dIAppModule = _$DIAppModule();
    final dIDataModule = _$DIDataModule();
    final repositoryModule = _$RepositoryModule();
    gh.lazySingleton<_i3.GlobalKey<_i3.NavigatorState>>(() => dIAppModule.key);
    gh.lazySingleton<_i4.ThemeStorage>(() => dIDataModule.themeStorage);
    gh.lazySingleton<_i5.UserStorage>(() => dIDataModule.userStorage);
    gh.factory<_i6.AuthenticationRepository>(() => repositoryModule
        .provideAuthenticationRepository(gh<_i5.UserStorage>()));
    gh.factory<_i7.ThemeRepository>(() =>
        repositoryModule.provideAccidentsRepository(gh<_i4.ThemeStorage>()));
    gh.factory<_i8.UserRepository>(
        () => repositoryModule.provideUserRepository(gh<_i5.UserStorage>()));
    return this;
  }
}

class _$DIAppModule extends _i9.DIAppModule {}

class _$DIDataModule extends _i10.DIDataModule {}

class _$RepositoryModule extends _i11.RepositoryModule {}
