import 'package:get/get.dart';

class Go {
  static Future<dynamic> to(dynamic page, {dynamic arguments}) async {
    Get.to(
      page,
      arguments: arguments,
      transition:
          Transition.rightToLeft, // choose your page transition accordingly
      duration: const Duration(milliseconds: 350),
    );
  }
}
