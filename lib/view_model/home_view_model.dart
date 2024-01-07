
import 'package:flutter/material.dart';
import 'package:refresh_token_flutter/core/logout_helper.dart';
import 'package:refresh_token_flutter/domain/vos/address_vo.dart';
import 'package:refresh_token_flutter/utils/db_constants.dart';

import '../core/preference_helper.dart';
import '../domain/data/api_repo.dart';
import '../domain/data/impl/api_repo_impl.dart';
import '../presentation/reusable_widget/all_dialog.dart';
import '../presentation/reusable_widget/noti_status_widget.dart';

class HomeViewModel extends ChangeNotifier {
  final PreferencesHelper _helper = PreferencesHelper();
  String tokenValue = "";
  int count =0;
  String totalCount = "0";
  AddressVo? vo;

  bool isFirstTime = true;
  bool isMax = false;

  List<Item> deliAddressList = [];

  bool isLoading = true;
  bool isError = false;
  String message = "";
  
  late ApiRepo repo = ApiRepoImpl();
  HomeViewModel({required context}) {
    checkLogin();
    getAllAddress(context: context);

  }

  init({required context}) {
    bool isLoading = true;
    bool isError = false;
    count = 0;
    totalCount = "0";
    deliAddressList.clear();
    getAllAddress(context: context);
    notifyListeners();
  }

  checkLogin() async{
    tokenValue = await _helper.getString(prefAllToken);
    notifyListeners();
  }
  
  
  getAllAddress({context}) async{
    if(!isFirstTime) {
      isLoading = true;
    }
    print("count $isMax");
    await repo.getAllAddress({
      "first": count,
      "max": 10
    }).then((value){

      AddressVo vo = value;
      isLoading = false;
      isError = false;
      message = "";
      totalCount = "${vo.totalRecords??"0"}";

      if((vo.items??[]).isEmpty) {
        isMax = true;
      //  NotiStatusWidget.showSnackBar(context: context, title: "End of list");
      } else {
        deliAddressList.addAll(vo.items!);
        count++;
        isMax = false;
      }

      notifyListeners();
    },onError: (error) {
      isLoading = true;
      if(isFirstTime) {
        isError = true;
      }
      NotiStatusWidget.showSnackBar(context: context, title: "Error $error");
      message = "";
      notifyListeners();
    });
    notifyListeners();
  }

  onLogout(context) {
    showLoadingDialog(context);


    repo.onLogOut().then((value) {
      debugPrint("value==>$value");
      LogoutHelper().onLogout();
    }).catchError((error) {
      Navigator.pop(context);
      debugPrint("error ==>$error");
      NotiStatusWidget.showSnackBar(context: context, title: "Error $error");
    });
    notifyListeners();
  }

}