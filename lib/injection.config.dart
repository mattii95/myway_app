// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:myway_app/src/data/datasources/remote/services/AuthService.dart'
    as _i773;
import 'package:myway_app/src/di/AppModule.dart' as _i871;
import 'package:myway_app/src/domain/repositories/AuthRepository.dart' as _i910;
import 'package:myway_app/src/domain/use-cases/auth/AuthUseCases.dart' as _i46;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i773.AuthService>(() => appModule.authService);
    gh.factory<_i910.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i46.AuthUseCases>(() => appModule.authUseCases);
    return this;
  }
}

class _$AppModule extends _i871.AppModule {}
