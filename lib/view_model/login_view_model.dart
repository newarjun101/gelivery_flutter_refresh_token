import 'package:flutter/material.dart';
import 'package:refresh_token_flutter/domain/data/api_repo.dart';
import 'package:refresh_token_flutter/domain/data/impl/api_repo_impl.dart';
import 'package:refresh_token_flutter/presentation/reusable_widget/all_dialog.dart';
import 'package:refresh_token_flutter/presentation/reusable_widget/noti_status_widget.dart';
import 'package:refresh_token_flutter/presentation/screen/home_screen/home_screen.dart';

class LoginViewModel extends ChangeNotifier {
  late ApiRepo repo;

  bool isChecked = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginViewModel() {
    repo = ApiRepoImpl();
  }

  onLogin({required BuildContext context}) {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      NotiStatusWidget.showSnackBar(
          context: context, title: "Please fill the data correctly");
    } else if (!isChecked) {
      NotiStatusWidget.showSnackBar(
          context: context,
          title: "You must agree our term & condition to use our service");
    } else {
      showLoadingDialog(context);
      repo.login(emailController.text, passwordController.text).then((value) {
        debugPrint("login success==>$value");
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
            (route) => false);
      }).catchError((error) {
        Navigator.pop(context);
        debugPrint("login error==>$error");
        NotiStatusWidget.showSnackBar(context: context, title: "Error $error");
      });
      notifyListeners();
    }
  }

  onChangeStatus(bool? status) {
    isChecked = status ?? false;
    notifyListeners();
  }
}
