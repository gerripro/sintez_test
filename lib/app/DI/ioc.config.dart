// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;
import 'package:sintez_test/app/db/sintez_sql_db.dart' as _i3;
import 'package:sintez_test/modules/feed/dao/likes_dao_sqflite_impl.dart'
    as _i8;
import 'package:sintez_test/modules/feed/dao/post_dao_sqflite_impl.dart' as _i7;
import 'package:sintez_test/modules/feed/repositories/likes_repository.dart'
    as _i9;
import 'package:sintez_test/modules/feed/repositories/post_repository.dart'
    as _i10;
import 'package:sintez_test/modules/navigation/router/navigation_register_module.dart'
    as _i5;
import 'package:sintez_test/modules/shared_preferences/factories/shared_preferences_registration_module.dart'
    as _i13;
import 'package:sintez_test/modules/shared_preferences/wrappers/shared_preferences_wrapper.dart'
    as _i6;
import 'package:sintez_test/modules/theme/repositories/theme_repository.dart'
    as _i11;
import 'package:sintez_test/modules/theme/stores/theme_store.dart' as _i12;

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
    final sharedPreferencesRegisterModule = _$SharedPreferencesRegisterModule();
    final appRouterRegistrationModule = _$AppRouterRegistrationModule();
    await gh.factoryAsync<_i3.SDatabase>(
      () => sDatabaseRegistrationModule.getInstance(),
      preResolve: true,
    );
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => sharedPreferencesRegisterModule.getPrefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i5.SintezAppRouter>(
        () => appRouterRegistrationModule.appRouter);
    gh.lazySingleton<_i6.SharedPreferencesWrapper>(() =>
        _i6.SharedPreferencesWrapper(
            sharedPreferences: gh<_i4.SharedPreferences>()));
    gh.lazySingleton<_i7.PostDaoSqfliteImpl>(
        () => _i7.PostDaoSqfliteImpl(database: gh<_i3.SDatabase>()));
    gh.lazySingleton<_i8.LikesDaoSqfliteImpl>(
        () => _i8.LikesDaoSqfliteImpl(database: gh<_i3.SDatabase>()));
    gh.lazySingleton<_i9.LikesRepository>(
        () => _i9.LikesRepository(likesDao: gh<_i8.LikesDaoSqfliteImpl>()));
    gh.lazySingleton<_i10.PostRepository>(
        () => _i10.PostRepository(postDao: gh<_i7.PostDaoSqfliteImpl>()));
    gh.lazySingleton<_i11.ThemeRepository>(
        () => _i11.ThemeRepository(gh<_i6.SharedPreferencesWrapper>()));
    gh.lazySingleton<_i12.ThemeStore>(
        () => _i12.ThemeStore(themeRepository: gh<_i11.ThemeRepository>()));
    return this;
  }
}

class _$SDatabaseRegistrationModule extends _i3.SDatabaseRegistrationModule {}

class _$SharedPreferencesRegisterModule
    extends _i13.SharedPreferencesRegisterModule {}

class _$AppRouterRegistrationModule extends _i5.AppRouterRegistrationModule {}
