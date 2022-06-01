import 'package:getxstarter/app/controllers/auth_controller.dart';
import 'package:getxstarter/app/views/user/tab_screen/tab_screen_controller.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(TabScreenController());
  }
}
