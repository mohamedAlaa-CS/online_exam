import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class SharedPreferencesHelper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Removes a value from SharedPreferences with given [key].
  static removeData({required String key}) async {
    await sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static clearAllData() async {
    await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static saveData({required String key, required dynamic value}) async {
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    if (value is String) {
      await sharedPreferences.setString(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    } else {
      return null;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static getBool({required String key}) {
    debugPrint("SharedPrefHelper : getBool with key : $key");
    return sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static getDouble({required String key}) {
    debugPrint("SharedPrefHelper : getDouble with key : $key");
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static getInt({required String key}) {
    debugPrint("SharedPrefHelper : getInt with key : $key");
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  static getString({required String key}) {
    debugPrint("SharedPrefHelper : getString with key : $key");
    return sharedPreferences.getString(key) ?? "";
  }

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static setSecuredString({required String key, required String value}) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
        "FlutterSecureStorage : setSecuredString with key : $key and value : $value");
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static getSecuredString({required String key}) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint("FlutterSecureStorage : getSecuredString with key :");
    return await flutterSecureStorage.read(key: key) ?? "";
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static clearAllSecuredData() async {
    debugPrint("FlutterSecureStorage : all data has been cleared");
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}
