import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _prefs;

  /// Initialize shared preferences
  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Set a string value in SharedPreferences
  static Future<bool> setString(String key, String value) async {
    return await _prefs?.setString(key, value) ?? false;
  }

  /// Get a string value from SharedPreferences
  static String getStringAsync(String key, {String defaultValue = ''}) {
    return _prefs?.getString(key) ?? defaultValue;
  }

  /// Set a bool value in SharedPreferences
  static Future<bool> setBool(String key, bool value) async {
    return await _prefs?.setBool(key, value) ?? false;
  }

  /// Get a bool value from SharedPreferences
  static bool getBoolAsync(String key, {bool defaultValue = false}) {
    return _prefs?.getBool(key) ?? defaultValue;
  }

  /// Set an int value in SharedPreferences
  static Future<bool> setInt(String key, int value) async {
    return await _prefs?.setInt(key, value) ?? false;
  }

  /// Get an int value from SharedPreferences
  static int getIntAsync(String key, {int defaultValue = 0}) {
    return _prefs?.getInt(key) ?? defaultValue;
  }

  /// Set value in SharedPreferences
  static Future<bool> setValue(String key, dynamic value) async {
    if (value is String) {
      return await setString(key, value);
    } else if (value is bool) {
      return await setBool(key, value);
    } else if (value is int) {
      return await setInt(key, value);
    } else {
      throw ArgumentError('Unsupported type: ${value.runtimeType}');
    }
  }

  /// Remove a key from SharedPreferences
  static Future<bool> removeKey(String key) async {
    return await _prefs?.remove(key) ?? false;
  }

  /// Clear all SharedPreferences
  static Future<bool> clear() async {
    return await _prefs?.clear() ?? false;
  }
}
