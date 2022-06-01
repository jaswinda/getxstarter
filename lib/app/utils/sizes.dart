import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppSizes {
  static double screenHeight = 0;
  static double screenWidth = 0;

  void init(BuildContext context) {
    screenHeight = 100.h;
    screenWidth = 100.w;
  }

  static double percentHeight(double val) => val.h;
  static double percentWidth(double val) => val.w;
  static double fontSize(double val) => val.sp;

  static percentFontSize(double d) {}
}
