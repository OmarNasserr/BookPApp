import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constant/colors.dart';
import '../../Controllers/GeoLocationControllers/GeoLocationAPIs.dart';
import '../../Controllers/PlaygroundController/NearestPlaygroundController.dart';
import '../../Controllers/ViewController/ViewController.dart';
import '../frquent_used_widgets/CustText.dart';

class DistanceSlider extends StatelessWidget {
  const DistanceSlider({
    Key? key,
    required this.viewController,
    required this.screenHeight,
    required this.screenWidth,
    required this.nearestPlaygroundsController,
  }) : super(key: key);

  final ViewController viewController;
  final double screenHeight;
  final double screenWidth;
  final NearestPlaygroundsController nearestPlaygroundsController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: viewController.getPortrait(screenHeight / 25, screenWidth / 30),
      width: viewController.getPortrait(screenWidth / 1.1, screenWidth / 1.4),
      child: Row(
        children: [
          Container(
            width: viewController.getPortrait(
                screenWidth / 1.5, screenWidth / 1.8),
            child: Obx(
                  () => Slider(
                value: nearestPlaygroundsController.getDistance(),
                onChanged: (double value) {
                  nearestPlaygroundsController.setDistance(value);
                },
                onChangeEnd: (double value) async {
                  nearestPlaygroundsController.setDistance(value);
                  var location =
                  await Get.find<GeoLocationAPIs>().determinePosition();
                  var passedLocation =
                      "${location.latitude.toString()},${location.longitude.toString()}";
                  await nearestPlaygroundsController.fetchPlaygrounds(
                      location: passedLocation,
                      distance:
                      nearestPlaygroundsController.getDistance().toInt());
                },
                min: 5,
                max: 50,
                activeColor: secondaryColor,
                // label: "distance",
              ),
            ),
          ),
          Obx(
                () => Container(
              width: viewController.getPortrait(
                  screenWidth / 4.7, screenWidth / 4.7),
              child: Center(
                child: CustText(
                  text:
                  '${nearestPlaygroundsController.getDistance().toInt()} KMs',
                  fontSize: viewController.getPortrait(
                      screenWidth / 22, screenWidth / 22),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
