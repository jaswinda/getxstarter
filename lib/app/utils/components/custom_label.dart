import 'package:getxstarter/app/utils/colors.dart';
import 'package:getxstarter/app/utils/sizes.dart';
import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String text;
  const CustomLabel({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSizes.percentHeight(1)),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(
              fontSize: AppSizes.percentHeight(2.5),
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          )),
    );
  }
}
