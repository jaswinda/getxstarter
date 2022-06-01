import 'package:getxstarter/app/utils/components/custom_button.dart';
import 'package:getxstarter/app/utils/routes.dart';
import 'package:getxstarter/app/views/user/some_screen.dart';
import 'package:getxstarter/app/views/user/tab_screen/tab_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabController = Get.find<TabScreenController>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Obx(() => Text('Tab Index: ' +
                  tabController.currentIndex.value.toString()))),
          Obx(() => Container(
                child: tabController.currentIndex.value == 0
                    ? const Text('')
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                            onTap: () => tabController.changeCurrentIndex(
                                tabController.currentIndex.value - 1),
                            label: 'Go 1 Index Back'),
                      ),
              )),
          ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SomeScreen())),
            child: const Text('Go to about Page Inside Tab'),
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed(Routes.somescreen),
            child: const Text('Go to about Page Outside Tab'),
          ),
        ],
      ),
    );
  }
}
