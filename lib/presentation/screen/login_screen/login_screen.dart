import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refresh_token_flutter/presentation/reusable_widget/custom_text_field.dart';
import 'package:refresh_token_flutter/utils/color_constants.dart';
import 'package:refresh_token_flutter/utils/font_and_margin.dart';
import 'package:refresh_token_flutter/view_model/login_view_model.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (_,viewModel,__) {
          return Scaffold(


            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Container(
                  height: 400,
                  margin: EdgeInsets.all(kDefaultMarginWidth),
                  padding: EdgeInsets.all(kDefaultMarginWidth),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).shadowColor,
                            offset: Offset(2,2),
                            spreadRadius: 4,
                            blurRadius: 4
                        )
                      ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      CircleAvatar(
                        radius: 48, // Image radius
                        backgroundImage: AssetImage("assets/image/logo.png"),
                      ),
                      CustomTextField(width: double.infinity,prefixIcon: Icons.phone,
                        textController: viewModel.emailController,
                        hint: "Email or phone number",),
                      CustomTextField(width: double.infinity,
                        textController: viewModel.passwordController,
                        prefixIcon: Icons.lock,hint: "Password",prefixIconSize: 26,),
                      SizedBox(height: 12,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                      Checkbox(value: viewModel.isChecked, onChanged:viewModel.onChangeStatus,activeColor: primaryColor, ),
                      Text("Term & Condition",style: TextStyle(color: primaryColor,fontSize: 18,decoration: TextDecoration.underline))
                    ],),
                      SizedBox(height: 12,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){

                            viewModel.onLogin(context: context);
                          },
                          child: Text("login"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
