import 'dart:convert';
import 'package:getxstarter/app/controllers/auth_controller.dart';
import 'package:getxstarter/app/utils/commons.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CustomHttp {
  post({required String url, required body, applyMiddleware = true}) async {
    var user = AuthController().setUser();
    if (user == null && applyMiddleware) {
      Get.offAllNamed('/login');
      return null;
    } else {
      return Get.showOverlay(
          asyncFunction: () async {
            //delay for 2 seconds
            var uri = Uri.parse(url);
            var response = await http.post(uri, body: body, headers: {
              'accept': 'application/json',
            });

            return jsonDecode(response.body);
          },
          loadingWidget: customLoader());
    }
  }

  get({required String url}) async {
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    return jsonDecode(response.body);
  }
}
