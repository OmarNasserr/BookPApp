import 'package:flutter/material.dart';

import '../../Controllers/ViewController/ViewController.dart';

class IconInsideCircle extends StatelessWidget {
  const IconInsideCircle({
    Key? key,
    required this.viewController,
    required this.screenHeight,
    required this.screenWidth,
    required this.iconData,
    this.circleColor = Colors.white,
    this.changeIconColorToWhite = false,
    this.heightDiv = 22,
    this.widthDiv = 9.5,
    required this.onTap,
    this.iconActive = false,
    this.iconData2 = '',
    this.changeIconColor = false,
    this.differentColor = Colors.white,
  }) : super(key: key);

  final ViewController viewController;
  final double screenHeight;
  final double screenWidth;
  final String iconData;
  final String iconData2;
  final Color circleColor;
  final bool changeIconColorToWhite;
  final double heightDiv;
  final double widthDiv;
  final VoidCallback onTap;
  final bool iconActive;
  final bool changeIconColor;
  final Color differentColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: viewController.getPortrait(
            screenHeight / heightDiv, screenWidth / heightDiv),
        width: viewController.getPortrait(
            screenWidth / widthDiv, screenWidth / widthDiv),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: circleColor,
        ),
        // child: SvgPicture.asset(
        //   iconActive ? iconData2 : iconData,
        //   fit: BoxFit.scaleDown,
        //   color: iconActive
        //       ? changeIconColor
        //           ? differentColor
        //           : Colors.black
        //       : changeIconColorToWhite
        //           ? Colors.white
        //           : Colors.black,
        // ),
      ),
    );
  }
}
