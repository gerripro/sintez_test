import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreferencesWrapper {
  final SharedPreferences sharedPreferences;

  SharedPreferencesWrapper({required this.sharedPreferences});

  String? getStringByKey(String key) {
    return sharedPreferences.getString(key);
  }

  Future<bool> setString({required String key, required String value}) async {
    return await sharedPreferences.setString(key, value);
  }
}
