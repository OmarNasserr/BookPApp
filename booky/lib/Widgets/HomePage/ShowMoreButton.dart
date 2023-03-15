import 'package:booky/Screens/Nearest_pGrounds.dart';
import 'package:booky/Screens/Cities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/ViewController/ViewController.dart';
import '../frquent_used_widgets/CustText.dart';

class ShowMoreButton extends StatelessWidget {
  ShowMoreButton({
    required this.screenWidth,
    required this.screenHeight,
    required this.viewController,
    this.pGround = true, required this.playgroundsOrTowns,
  });

  final double screenWidth;
  final double screenHeight;
  final ViewController viewController;
  final bool pGround;
  final List<Widget> playgroundsOrTowns;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        debugPrint('pgT $playgroundsOrTowns');
        pGround
            ? Get.to(() => NearestPGrounds(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight, playgrounds: playgroundsOrTowns,
                ))
            : Get.to(() => Cities(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
          towns: playgroundsOrTowns,
                ));
      },
      child: SizedBox(
        height: viewController.getPortrait(screenHeight / 15, screenWidth / 15),
        width:
            viewController.getPortrait(screenWidth / 1.1, screenWidth / 1.35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustText(
                text: "اعرض المزيد",
                fontSize: viewController.getPortrait(
                    screenWidth / 15, screenHeight / 15)),
            Icon(
              Icons.arrow_forward_ios,
              size: viewController.getPortrait(
                  screenWidth / 15, screenHeight / 15),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
