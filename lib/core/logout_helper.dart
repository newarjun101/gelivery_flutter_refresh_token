import 'package:flutter/material.dart';
import 'package:refresh_token_flutter/core/preference_helper.dart';

import '../main.dart';
import '../presentation/screen/login_screen/login_screen.dart';

class LogoutHelper {


  void onLogout() async{

    await PreferencesHelper().deleteToken();
    navigatorKey.currentState?.pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ),(Route<dynamic> route) => false);
  }
}