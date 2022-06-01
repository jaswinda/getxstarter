import 'package:getxstarter/app/middlewares/auth_middleware.dart';
import 'package:getxstarter/app/views/guest/login_page.dart';
import 'package:getxstarter/app/views/user/some_screen.dart';
import 'package:getxstarter/app/views/user/tab_screen/tab_screen_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String home = '/';
  static const String login = '/login';

  static const String forgotPassword = '/forgot-password';
  static const String somescreen = '/somescreen';

  List<GetPage<dynamic>>? getPages = [
    GetPage(
        name: home,
        page: () => const TabScreenPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: forgotPassword, page: () => LoginPage()),
    GetPage(name: somescreen, page: () => const SomeScreen()),
  ];
}
