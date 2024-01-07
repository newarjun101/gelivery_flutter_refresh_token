import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../utils/db_constants.dart';

class PreferencesHelper {

  static final PreferencesHelper _singleton =
  PreferencesHelper._internal();

  factory PreferencesHelper() {
    return _singleton;
  }

  PreferencesHelper._internal();

  ///all helper for share preference
  Future<bool?> getBool(String key) async {
    final preference = await sharePreference;
    return preference.getBool(key);
  }

  Future setBool(String key, bool value) async {
    final preference = await sharePreference;
    return preference.setBool(key, value);
  }


  Future<String> getString(String key) async {
    final preference = await sharePreference;
    return preference.getString(key) ?? '';
  }

  Future setString(String key, String value) async {
    final preference = await sharePreference;
    return preference.setString(key, value);
  }

  Future delete(String key) async {
    final preference = await sharePreference;
    return preference.remove(key);
  }


  Future<SharedPreferences> get sharePreference =>
      SharedPreferences.getInstance();


  Future<void> onSaveToken(Map<String,dynamic> value) async{
    await setString(
        prefAllToken,
        jsonEncode({
          "access_token" : value["data"]["access_token"],
          "refresh_token" : value["data"]["refresh_token"],
          "expires" : value['data']["expires_in"]
        })
    );
    await setString(prefRefreshToken, value["data"]["refresh_token"]);
    await setString(prefAccessToken, value["data"]["access_token"]);
  }
  Future<void> deleteToken() async{
    await delete(
        prefAllToken);
    await delete(prefRefreshToken);
    await delete(prefAccessToken);
  }
}