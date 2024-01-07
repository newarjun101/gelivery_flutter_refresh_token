import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refresh_token_flutter/presentation/screen/home_screen/home_screen.dart';
import 'package:refresh_token_flutter/presentation/screen/login_screen/login_screen.dart';
import 'package:refresh_token_flutter/utils/color_constants.dart';
import 'package:refresh_token_flutter/utils/font_and_margin.dart';
import 'package:refresh_token_flutter/view_model/main_view_model.dart';

/// for navigation
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String myToken = "";
    return ChangeNotifierProvider(
      create: (_)=>MainViewModel(),
      child: Consumer<MainViewModel>(
        builder: (_,viewModel,__) {
          myToken = viewModel.isFirstTime;
          print("$myToken");
          return MaterialApp(
            title: 'Flutter Demo',
              navigatorKey : navigatorKey,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
              scaffoldBackgroundColor: Color(0xfffafafa) ,
              shadowColor: Color(0xfff3f3f3),
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    elevation: 0,
                    minimumSize: const Size(120, 38),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    textStyle:
                    const TextStyle(color: Colors.white, fontSize: kBodyFontSize),
                  )),
              iconTheme: IconThemeData(
                color: hintColor,
                size: 32
              ),
              useMaterial3: false,
            ),
            home: myToken.isEmpty?LoginScreen() : HomeScreen(),
          );
        }
      ),
    );
  }
}


