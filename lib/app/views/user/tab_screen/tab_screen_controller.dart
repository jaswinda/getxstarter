import 'package:getxstarter/app/utils/colors.dart';
import 'package:getxstarter/app/utils/sizes.dart';
import 'package:getxstarter/app/views/user/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class TabScreenController extends GetxController {
  var currentIndex = 0.obs;
  PageController pageController = PageController();

  PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      tabItem('Tab 1', icon: const Icon(Icons.home_outlined)),
      tabItem('Tab 2', icon: const Icon(Icons.account_balance_wallet_outlined)),
      tabItem('Tab 3', icon: const Icon(Icons.abc, color: Colors.white)),
      tabItem('Tab 4', icon: const Icon(Icons.notifications_outlined)),
      tabItem('Tab 5', icon: const Icon(Icons.account_circle_outlined)),
    ];
  }

  PersistentBottomNavBarItem tabItem(title, {required Widget icon, screen}) {
    return PersistentBottomNavBarItem(
      textStyle: TextStyle(
          fontSize: AppSizes.percentWidth(2.5),
          color: Colors.black,
          fontWeight: FontWeight.bold),
      icon: icon,
      title: (title),
      activeColorPrimary: primaryColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    );
  }

  List<Widget> tabScreen = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
  ];

  get getcurrentIndex => currentIndex;
  changeCurrentIndex(int index) {
    currentIndex.value = index;
    persistentTabController.index = index;
  }
}
