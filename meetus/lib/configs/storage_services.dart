import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String APP_CONFIG = 'APP_CONFIG';
  static const String BIOMETRIC_CHECKED = 'BIOMETRIC_CHECKED';
  static const String OTP_VERIFIED = 'OTP_VERIFIED';
  static const String OTP_VERIFIED_STATE = 'OTP_VERIFIED_STATE';
  static const String USER_TOKEN = 'USER_TOKEN';
  static const String FIREBASE_INSTANCE_ID = 'FIREBASE_INSTANCE_ID';
  static const String APPLICATION_ID = 'APPLICATION_ID';
  static const String APPLICATION_NAME = 'APPLICATION_NAME';
  static const String INTRO_SHOWN = 'INTRO_SHOWN';
  static const String PRIVACY_POLICY_ACCEPTED = 'PRIVACY_POLICY_ACCEPTED';
  static const String IS_DEVICE_ROOTED = 'IS_DEVICE_ROOTED';
  static const String RESET_CREDENTIAL_OBJECT = 'RESET_CREDENTIAL_OBJECT';
  static const String USERNAME = 'USERNAME';
  static const String LOGIN = 'LOGIN';
  static const String USER = 'USER';
  static const String OTP_REF = 'OTP_REF';
  static const String IS_REGISTERED = 'IS_REGISTERED';
  static const String USER_ID = 'USER_ID';

  static Future<void> putStringAsync(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(key, value);
  }

  static Future<String> getStringAsync(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(key);
  }

  static Future<dynamic> putObjectAsync(String key, dynamic object) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String value = json.encode(object);

    return await preferences.setString(key, value);
  }

  static Future<dynamic> getObjectAsync(String key) async {
    dynamic object;
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String value = preferences.getString(key);
      dynamic object = json.decode(value);
      return object;
    } catch (e) {
      print(
          "An error occurred whilest trying to retreive object. Check if object exists");
      return object;
    }
  }

  static Future<void> putIntAsync(String key, int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setInt(key, value);
  }

  static Future<int> getIntAsync(String key) async {
    int value;
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      value = preferences.getInt(key);
      return value;
    } catch (e) {
      print(
          "An error occurred whilest trying to retreive object. Check if int exists");
      return value;
    }
  }

  static Future<void> putBoolAsync(String key, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setBool(key, value);
  }

  static Future<bool> getBoolAsync(String key) async {
    bool value;
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      value = preferences.getBool(key);
      return value;
    } catch (e) {
      print(
          "An error occurred whilest trying to retreive object. Check if int exists");
      return value;
    }
  }

  static Future<bool> removeKeyAsync(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.remove(key);
  }

  static Future<bool> removeDataAsync() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.clear();
  }

  static Future<void> putObjectListAsync(String key, List<String> value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setStringList(key, value);
  }

  static Future<List<String>> getObjectListAsync(String key) async {
    List<String> value;
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      value = preferences.getStringList(key);
      return value;
    } catch (e) {
      print(
          "An error occurred whilest trying to retreive object. Check if int exists");
      return value;
    }
  }
}
