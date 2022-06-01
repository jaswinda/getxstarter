import 'package:getxstarter/app/bindings/initial_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'app/utils/routes.dart';

SharedPreferences? sharedprefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedprefs = await SharedPreferences.getInstance();
  return runApp(const MyApp());
}
//get the root widget

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //middleware to handle the routes
        initialRoute: '/',
        getPages: Routes().getPages,
        //theme
        themeMode: ThemeMode.light,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        initialBinding: InitialBindings(),
        defaultTransition: Transition.rightToLeft,
        //duration of the transition
        transitionDuration: const Duration(milliseconds: 350),
        //get the debug
        debugShowCheckedModeBanner: false,
        //transition
      );
    });
  }
}
