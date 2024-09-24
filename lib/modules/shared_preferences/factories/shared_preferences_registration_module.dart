import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPreferencesRegisterModule {
  @preResolve
  Future<SharedPreferences> getPrefs() async =>
      await SharedPreferences.getInstance();
}
