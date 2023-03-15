import 'package:flutter/material.dart';

import '../../Controllers/ViewController/ViewController.dart';
import 'CustText.dart';

class HeadLine extends StatelessWidget {
  HeadLine({
    required this.viewController,
    required this.screenHeight,
    required this.screenWidth,
    required this.headline,
    this.widthDiv1 = 1.1,
    this.widthDiv2 = 1.2,
    this.fontDiv1 = 10,
    this.fontDiv2 = 14,
  });

  final ViewController viewController;
  final double screenHeight;
  final double screenWidth;
  final String headline;
  final double widthDiv1;
  final double widthDiv2;
  final double fontDiv1;
  final double fontDiv2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: viewController.getPortrait(screenHeight / 10, screenWidth / 10),
      width: viewController.getPortrait(
          screenWidth / widthDiv1, screenWidth / widthDiv2),
      child: Align(
        alignment: Alignment.centerRight,
        child: CustText(
          text: headline,
          fontSize: viewController.getPortrait(
            screenWidth / fontDiv1,
            screenWidth / fontDiv2,
          ),
        ),
      ),
    );
  }
}
