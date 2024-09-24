import 'package:injectable/injectable.dart';
import 'package:sintez_test/modules/shared_preferences/wrappers/shared_preferences_wrapper.dart';

@lazySingleton
class ThemeRepository {
  final SharedPreferencesWrapper _sharedPreferencesWrapper;

  ThemeRepository(this._sharedPreferencesWrapper);

  static const String _themeKey = 'theme';

  Future<void> setThemeMode({required String value}) async {
    await _sharedPreferencesWrapper.setString(key: _themeKey, value: value);
  }

  String? getThemeMode() {
    return _sharedPreferencesWrapper.getStringByKey(_themeKey);
  }
}
