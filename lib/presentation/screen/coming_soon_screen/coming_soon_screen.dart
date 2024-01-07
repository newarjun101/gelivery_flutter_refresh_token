import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


import '../../../utils/color_constants.dart';
import '../../../utils/font_and_margin.dart';

class ComingSoonScreen extends StatelessWidget {

  final String? title;
  final bool isBackIcon ;
  const ComingSoonScreen({super.key,  this.title,this.isBackIcon= false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: kDefaultMarginHeight),

        child: Center(
          child: Lottie.asset("assets/image/coming.json",width: double.infinity,height: double.infinity),
        ),
      ),
    );
  }
}