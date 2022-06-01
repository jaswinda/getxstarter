import 'package:getxstarter/app/controllers/auth_controller.dart';
import 'package:getxstarter/app/utils/colors.dart';
import 'package:getxstarter/app/utils/components/custom_button.dart';
import 'package:getxstarter/app/utils/components/custom_label.dart';
import 'package:getxstarter/app/utils/components/custom_textformfield.dart';
import 'package:getxstarter/app/utils/routes.dart';
import 'package:getxstarter/app/utils/sizes.dart';
import 'package:getxstarter/app/utils/transition.dart';
import 'package:getxstarter/app/views/guest/signup_page.dart';
import 'package:getxstarter/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: AppSizes.percentHeight(5)),
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: AppSizes.percentWidth(50),
                      height: AppSizes.percentHeight(20),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(AppSizes.percentHeight(2)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('LOGIN',
                          style: TextStyle(
                              fontSize: AppSizes.percentHeight(3),
                              fontWeight: FontWeight.bold,
                              color: primaryColor)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text('Login To Your Account',
                        style: TextStyle(
                            fontSize: AppSizes.percentHeight(2),
                            color: Colors.black)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(AppSizes.percentWidth(3.0)),
                    child: Column(
                      children: [
                        const Hero(
                            tag: 'username_label',
                            child: CustomLabel(text: 'Username')),
                        CustomTextField(
                          customValidator: (value) {
                            //email validation
                            return null;
                          },
                          controller: user,
                          obscureText: false,
                          hintText: 'Please enter your username',
                        ),
                        const Hero(
                            tag: 'password_label',
                            child: CustomLabel(text: 'Password')),
                        CustomTextField(
                          controller: pass,
                          obscureText: true,
                          hintText: 'Please enter your password',
                        ),
                        SizedBox(height: AppSizes.percentHeight(2)),
                        CustomButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                // authController.login(
                                //     email: user.text, password: pass.text);
                                //replace screen
                                sharedprefs!.setString('token', 'xxx');
                                Get.offAndToNamed(Routes.home);
                              }
                            },
                            label: 'Login'),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.percentHeight(3)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Doesn't have an account?",
                        style: TextStyle(fontSize: AppSizes.percentHeight(2)),
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(SignupPage());
                          Go.to(SignupPage());
                        },
                        child: Text(' Sign Up',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: AppSizes.percentHeight(2))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
