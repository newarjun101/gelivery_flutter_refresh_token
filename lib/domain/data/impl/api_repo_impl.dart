import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:refresh_token_flutter/core/preference_helper.dart';
import 'package:refresh_token_flutter/domain/data/api_repo.dart';
import 'package:refresh_token_flutter/utils/db_constants.dart';

import '../../../service/apibase_helper.dart';
import '../../../utils/api_constants.dart';
import '../../vos/address_vo.dart';

class ApiRepoImpl extends ApiRepo{
   ApiBaseHelper _apiBaseHelper= ApiBaseHelper();
   PreferencesHelper authService = PreferencesHelper();

  ApiRepoImpl() {
    print("api repo init");
    print("api repo init");

   // authService = PreferencesHelper();
    //_apiBaseHelper = ApiBaseHelper();

  }

  @override
  Future login(String userName, String password) async {
    debugPrint("login==>$userName");
    return _apiBaseHelper
        .post(ApiConstants.nLoginEndPoint,
        {"username": userName, "password": password}, false)
        .then((value) async {
      await authService.setString(
        prefAllToken,
        jsonEncode({
          "access_token" : value["data"]["access_token"],
          "refresh_token" : value["data"]["refresh_token"],
          "expires" : value['data']["expires_in"]
        })
      );
      await authService.setString(prefRefreshToken, value["data"]["refresh_token"]);
      await authService.setString(prefAccessToken, value["data"]["access_token"]);
      authService.setBool("first_run", true);
      return value;
    });
  }

  @override
  Future onLogOut() async {

    return _apiBaseHelper
        .post(ApiConstants.nLogOut,{},true)
        .then((value) async {
          print("value logout $value");
      return value;
    });
  }

   @override
   Future getAllAddress(Map<String, dynamic> body) async {

     return _apiBaseHelper
         .post(ApiConstants.nAddress,
         body, true)
         .then((value) async {

           print("value $value");
       AddressVo vo = AddressVo.fromJson(value["data"]);
       return vo;
     });
   }
}