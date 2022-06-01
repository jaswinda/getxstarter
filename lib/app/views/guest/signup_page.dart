import 'package:getxstarter/app/controllers/auth_controller.dart';
import 'package:getxstarter/app/utils/colors.dart';
import 'package:getxstarter/app/utils/components/custom_button.dart';
import 'package:getxstarter/app/utils/components/custom_label.dart';
import 'package:getxstarter/app/utils/components/custom_textformfield.dart';
import 'package:getxstarter/app/utils/sizes.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
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
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: AppSizes.percentWidth(50),
                      height: AppSizes.percentHeight(8),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: AppSizes.percentHeight(1)),
                  Padding(
                    padding: EdgeInsets.all(AppSizes.percentHeight(1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('SIGN UP',
                          style: TextStyle(
                              fontSize: AppSizes.percentHeight(3),
                              fontWeight: FontWeight.bold,
                              color: primaryColor)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text('Create Your Account',
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
                          controller: pass,
                          hintText: 'Please choose a username',
                        ),
                        const CustomLabel(text: 'Phone'),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey,
                                      width: AppSizes.percentWidth(0.5)),
                                  borderRadius: BorderRadius.circular(5)),
                              child: CountryCodePicker(
                                onChanged: print,
                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection: 'IN',
                                favorite: const ['+91', 'IN'],
                                // optional. Shows only country name and flag
                                showCountryOnly: false,
                                // optional. Shows only country name and flag when popup is closed.
                                showOnlyCountryWhenClosed: false,
                                // optional. aligns the flag and the Text left
                                alignLeft: false,
                              ),
                            ),
                            SizedBox(
                              width: AppSizes.percentWidth(2),
                            ),
                            Expanded(
                              child: CustomTextField(
                                controller: pass,
                                isPhoneNumber: true,
                                hintText: 'Phone number',
                              ),
                            ),
                          ],
                        ),
                        const CustomLabel(text: 'Email'),
                        CustomTextField(
                          customValidator: (value) {
                            //email validation
                            final bool isValid = EmailValidator.validate(value);
                            if (!isValid) {
                              return 'Please enter a valid email';
                            }
                          },
                          controller: user,
                          obscureText: false,
                          hintText: 'Please enter your email',
                        ),
                        const Hero(
                            tag: 'password_label',
                            child: CustomLabel(text: 'Password')),
                        CustomTextField(
                          controller: pass,
                          obscureText: true,
                          hintText: 'Please enter your password',
                        ),
                        const CustomLabel(text: 'Confirm Password'),
                        CustomTextField(
                          controller: pass,
                          obscureText: true,
                          hintText: 'Please enter your password',
                        ),
                        SizedBox(height: AppSizes.percentHeight(3)),
                        CustomButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                authController.login(
                                    email: user.text, password: pass.text);
                              }
                            },
                            label: 'Sign Up'),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.percentHeight(3)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: AppSizes.percentHeight(2)),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(' Login',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: AppSizes.percentHeight(2))),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.percentHeight(2)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
