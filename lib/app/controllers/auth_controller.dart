import 'dart:convert';
import 'package:getxstarter/app/utils/apis.dart';
import 'package:getxstarter/app/utils/commons.dart';
import 'package:getxstarter/app/utils/custom_http.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final http = CustomHttp();
  var user = {}.obs;

  @override
  void onInit() {
    super.onInit();
    setUser();
  }

  login({required String email, required String password}) async {
    var body = {'email': email, 'password': password};
    // print(body);
    var response =
        await http.post(url: loginAPI, body: body, applyMiddleware: false);
    if (response != null && response['success']) {
      saveUser(response['user']);
      showMessage(message: response['message'], isError: false);
    } else {
      showMessage(
          message:
              response != null ? response["message"] : 'Something Went Wrong!',
          isError: true);
    }
  }

  signUp(
      {required String email,
      required String name,
      required String phone,
      required String address,
      required String password}) async {
    var body = {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'address': address,
    };
    var response =
        await http.post(url: signUpAPI, body: body, applyMiddleware: false);
    if (response['success'] && response != null) {
      await saveUser(response['user']);
      showMessage(message: response['message'], isError: false);
    } else {
      showMessage(
          message:
              response != null ? response["message"] : 'Something Went Wrong!',
          isError: true);
    }
  }

  saveUser(savingUser) async {
    user.value = {};
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(savingUser));
    Get.offAllNamed('/');
    return setUser();
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user');

    Get.offAllNamed('/');
  }

  setUser() async {
    final prefs = await SharedPreferences.getInstance();
    var savedUser = prefs.getString('user');
    if (savedUser != null) {
      user.value = jsonDecode(savedUser);
    }
    return savedUser;
  }
}
