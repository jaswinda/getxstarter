import 'package:getxstarter/app/utils/commons.dart';
import 'package:getxstarter/app/utils/sizes.dart';
import 'package:getxstarter/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final bool hasMenuItems;
  const CustomAppBar({Key? key, this.hasMenuItems = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            left: AppSizes.percentWidth(2),
            top: AppSizes.percentHeight(1),
            bottom: AppSizes.percentHeight(1),
            right: AppSizes.percentWidth(2),
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => {},
                            child: Image.asset(
                              'assets/images/logo.png',
                              width: AppSizes.percentWidth(20),
                              height: AppSizes.percentHeight(10),
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () => {},
                            child: const Icon(
                              FontAwesomeIcons.questionCircle,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Spacer(),
                  ],
                ),
              ),
              if (hasMenuItems)
                Align(
                  alignment: Alignment.bottomRight,
                  child: PopupMenuButton<int>(
                    offset: Offset(
                      AppSizes.percentWidth(5),
                      AppSizes.percentHeight(6),
                    ),
                    color: Colors.white,
                    //action icon
                    icon: const Icon(Icons.more_vert),
                    //onSelected: (item) => onSelected(context, item),
                    itemBuilder: (context) => [
                      popMenuItem('Help', onTap: () => () {}),
                      const PopupMenuDivider(),
                      popMenuItem('Logout', onTap: () async {
                        await sharedprefs!.clear();
                        Get.offAllNamed('/');
                      }),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
