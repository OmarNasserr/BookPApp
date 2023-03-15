import 'package:booky/Widgets/frquent_used_widgets/CustText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/ViewController/ViewController.dart';
import '../../Screens/ReservationScreen.dart';

class HourRateAndButton extends StatelessWidget {
  HourRateAndButton({
    required this.viewController,
    required this.screenHeight,
    required this.screenWidth,
    required this.hourRate,
    required this.buttonText,
    required this.textBelowHour,
    required this.onTap,
  });

  final ViewController viewController;
  final double screenHeight;
  final double screenWidth;
  final double hourRate;
  final String buttonText;
  final String textBelowHour;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: viewController.getPortrait(screenHeight / 10, screenWidth / 10),
      width: viewController.getPortrait(screenWidth / 1.2, screenWidth / 1.2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth / 12),
      ),
      child: Row(
        children: [
          Container(
            height:
                viewController.getPortrait(screenHeight / 8, screenWidth / 8),
            width: viewController.getPortrait(
                screenWidth / 2.308, screenWidth / 2.308),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth / 12),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: viewController.getPortrait(
                      screenHeight / 90, screenWidth / 90),
                ),
                CustText(
                  text: "L.E ${hourRate.toString()}",
                  fontSize: viewController.getPortrait(
                      screenWidth / 12, screenHeight / 12),
                  color: Colors.green[800]!,
                ),
                CustText(
                  text: textBelowHour,
                  fontSize: viewController.getPortrait(
                      screenWidth / 15, screenHeight / 15),
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height:
                  viewController.getPortrait(screenHeight / 8, screenWidth / 8),
              width: viewController.getPortrait(
                  screenWidth / 2.5, screenWidth / 2.5),
              decoration: BoxDecoration(
                color: Colors.green[900],
                borderRadius: BorderRadius.circular(screenWidth / 12),
              ),
              child: Center(
                child: CustText(
                    text: buttonText,
                    fontSize: viewController.getPortrait(
                        screenWidth / 15, screenHeight / 10)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
