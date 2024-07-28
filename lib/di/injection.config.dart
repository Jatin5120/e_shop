// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_shop/data/local/db_client.dart' as _i165;
import 'package:e_shop/providers/auth_provider.dart' as _i10;
import 'package:e_shop/providers/dashboard_provider.dart' as _i507;
import 'package:e_shop/repositories/dashboard_repository.dart' as _i57;
import 'package:e_shop/repositories/repositories.dart' as _i865;
import 'package:e_shop/services/auth_service.dart' as _i1031;
import 'package:e_shop/services/config_service.dart' as _i149;
import 'package:e_shop/services/dashboard_service.dart' as _i527;
import 'package:e_shop/services/services.dart' as _i530;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i57.DashboardRepository>(
        () => _i57.DashboardRepository());
    gh.lazySingleton<_i165.DbClient>(() => _i165.DbClient());
    gh.lazySingleton<_i1031.AuthService>(() => _i1031.AuthService());
    gh.lazySingleton<_i149.ConfigService>(() => _i149.ConfigService());
    gh.lazySingleton<_i527.DashboardService>(
        () => _i527.DashboardService(gh<_i865.DashboardRepository>()));
    gh.lazySingleton<_i10.AuthProvider>(
        () => _i10.AuthProvider(gh<_i530.AuthService>()));
    gh.lazySingleton<_i507.DashboardProvider>(
        () => _i507.DashboardProvider(gh<_i530.DashboardService>()));
    return this;
  }
}
