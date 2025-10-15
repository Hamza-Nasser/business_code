import 'dart:async' show Future;

import 'package:shared_preferences/shared_preferences.dart';

enum PreferencesKey {
  accessToken,
  isLoggedIn,
  isOnboardingShown,
  userId,
  blockList,
  lengthOfProductList,
  locale,
  cards,
}

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async =>
      _preferencesInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _preferencesInstance;

  // call this method from iniState() function of MainApp().
  static Future<SharedPreferences?> init() async {
    _preferencesInstance = await _instance;
    return _preferencesInstance;
  }

  static String getString(PreferencesKey key, [String? defValue]) {
    return _preferencesInstance?.getString(key.name) ?? defValue ?? "";
  }

  static Future<bool> setString(PreferencesKey key, String value) async {
    SharedPreferences? preferences = await _instance;
    return preferences.setString(key.name, value);
  }

  static bool getBool(PreferencesKey key, [bool? defValue]) {
    return _preferencesInstance?.getBool(key.name) ?? defValue ?? false;
  }

  static Future<bool> setBool(PreferencesKey key, bool value) async {
    SharedPreferences? preferences = await _instance;
    return preferences.setBool(key.name, value);
  }

  static Future<bool> setInt(PreferencesKey key, int value) async {
    SharedPreferences? preferences = await _instance;
    return preferences.setInt(key.name, value);
  }

  static int getInt(PreferencesKey key, [int? defValue]) {
    return _preferencesInstance?.getInt(key.name) ?? defValue ?? 0;
  }
}
