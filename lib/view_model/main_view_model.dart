

import 'package:flutter/material.dart';
import 'package:refresh_token_flutter/utils/db_constants.dart';

import '../core/preference_helper.dart';

class MainViewModel extends ChangeNotifier {


  final PreferencesHelper _helper = PreferencesHelper();
  String isFirstTime = "";

  MainViewModel() {
    checkLogin();
  }


  checkLogin() async{
    isFirstTime = await _helper.getString(prefAllToken);
    notifyListeners();
  }


}