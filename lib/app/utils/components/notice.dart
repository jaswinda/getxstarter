import 'package:getxstarter/app/utils/colors.dart';
import 'package:getxstarter/app/utils/sizes.dart';
import 'package:flutter/material.dart';

class Notice extends StatelessWidget {
  final bool isHidden;
  final Function onCancel;
  final String text;
  const Notice(
      {Key? key, this.isHidden = false, this.text = "", required this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isHidden ? Container() : notice(text: text);
  }

  Widget notice({required String text}) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.percentWidth(2)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(AppSizes.percentWidth(2)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              //shadow
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(AppSizes.percentWidth(2)),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: AppSizes.percentHeight(1.5),
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            top: -AppSizes.percentHeight(1),
            right: 0,
            child: InkWell(
                onTap: () => onCancel(),
                child: const Icon(Icons.cancel_outlined)),
          ),
        ],
      ),
    );
  }
}
