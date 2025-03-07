import 'package:shared_preferences/shared_preferences.dart';

final class SharedPreferencesHelper {
  SharedPreferencesHelper(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  Future<void> saveString(String key, String value) async =>
      await _sharedPreferences.setString(key, value);

  String? getString(String key) => _sharedPreferences.getString(key);

  Future<void> deleteString(String key) async => await _sharedPreferences.remove(key);
}
