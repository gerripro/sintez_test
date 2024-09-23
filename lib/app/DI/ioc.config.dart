// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sintez_test/app/db/sintez_sql_db.dart' as _i3;
import 'package:sintez_test/modules/navigation/router/navigation_register_module.dart'
    as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sDatabaseRegistrationModule = _$SDatabaseRegistrationModule();
    final appRouterRegistrationModule = _$AppRouterRegistrationModule();
    await gh.factoryAsync<_i3.SDatabase>(
      () => sDatabaseRegistrationModule.getInstance(),
      preResolve: true,
    );
    gh.lazySingleton<_i4.SintezAppRouter>(
        () => appRouterRegistrationModule.appRouter);
    return this;
  }
}

class _$SDatabaseRegistrationModule extends _i3.SDatabaseRegistrationModule {}

class _$AppRouterRegistrationModule extends _i4.AppRouterRegistrationModule {}
