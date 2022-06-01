import 'package:getxstarter/app/utils/components/custom_app_bar.dart';
import 'package:getxstarter/app/utils/sizes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import './tab_screen_controller.dart';

class TabScreenPage extends GetView<TabScreenController> {
  const TabScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TabScreenController>();
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(
            hasMenuItems: true,
          ),
        ),
        body: SizedBox(
          child: PersistentTabView(
            context,
            controller: controller.persistentTabController,
            padding: NavBarPadding.all(AppSizes.percentWidth(1)),
            //buyer-seller-screen-getxstarter
            screens: controller.tabScreen,
            items: controller.navBarsItems(),
            onItemSelected: (int index) => controller.changeCurrentIndex(index),
            confineInSafeArea: true,
            backgroundColor: Colors.white, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset:
                true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows: true,
            // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(0),
              colorBehindNavBar: Colors.white,
              boxShadow: [
                const BoxShadow(
                  color: Colors.grey,
                  offset: Offset(3, 3),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.once,
            itemAnimationProperties: const ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            //slide

            screenTransitionAnimation: const ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: false,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle
                .style15, // Choose the nav bar style with this property.
          ),
        ));
  }
}
