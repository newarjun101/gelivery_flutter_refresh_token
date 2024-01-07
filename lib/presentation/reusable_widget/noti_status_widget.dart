import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

class NotiStatusWidget {

  static final NotiStatusWidget _singleton = NotiStatusWidget._internal();

  factory NotiStatusWidget() {
    return _singleton;
  }

  NotiStatusWidget._internal();

  /// snack bar
  static void showSnackBar(
      {required BuildContext context, required String title, Color? backgroundColor, TextStyle? textStyle, Duration? duration}) {
    final snackBar = SnackBar(
      content: Text(title, style: textStyle,),
      backgroundColor: backgroundColor ?? Theme
          .of(context)
          .primaryColor,
      duration: duration ?? const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}