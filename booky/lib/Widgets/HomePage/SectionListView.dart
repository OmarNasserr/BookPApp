import 'package:booky/Controllers/LocationControllers/CitiesController.dart';
import 'package:booky/Controllers/PlaygroundController/NearestPlaygroundController.dart';
import 'package:booky/Models/LocationModels/CitiesModel.dart';
import 'package:coverflow/coverflow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../Controllers/UI_Controllers/AlertsAndLoadingControllers.dart';
import '../../Controllers/UI_Controllers/CardUI_BuilderController.dart';
import '../../Controllers/ViewController/ViewController.dart';
import '../../Models/PlaygroundModel.dart';
import '../frquent_used_widgets/CustText.dart';
import '../frquent_used_widgets/HeadLine.dart';
import '../frquent_used_widgets/LoadingWidget.dart';
import 'PlaygroundCard.dart';
import 'ShowMoreButton.dart';

class SectionListView extends StatelessWidget {
  SectionListView({
    required this.viewController,
    required this.screenHeight,
    required this.screenWidth,
    required this.headline,
    this.pGround = true,
    required this.nearestPlaygroundsOrCitiesController,
  });

  final ViewController viewController;
  final double screenHeight;
  final double screenWidth;
  final String headline;
  final bool pGround;

  ///if true shows playgrounds, if false shows cities
  final nearestPlaygroundsOrCitiesController;

  AlertsAndLoadingControllers alertsAndLoadingControllers =
      Get.find<AlertsAndLoadingControllers>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadLine(
          viewController: viewController,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          headline: headline,
        ),
        Obx(
          () => SizedBox(
            width: viewController.getPortrait(screenWidth, screenWidth / 1.3),
            height:
                viewController.getPortrait(screenHeight / 4, screenWidth / 4),
            child: pGround
                ? alertsAndLoadingControllers.getNearestPlaygroundLoading()
                    ?  Center(
                        child: LoadingWidget())
                    : nearestPlaygroundsOrCitiesController
                            .getNearestPlaygroundController()
                            .isEmpty
                        ? Center(
                            child: Container(
                            height: viewController.getPortrait(
                                screenHeight / 5, screenWidth / 5),
                            width: viewController.getPortrait(
                                screenWidth / 1.3, screenWidth / 1.3),
                            child: Center(
                              child: CustText(
                                text:
                                    "لا توجد ملاعب في هذا النطاق\nاضغط على اعرض المزيد و وسع النطاق",
                                fontSize: viewController.getPortrait(
                                  screenWidth / 25,
                                  screenWidth / 3,
                                ),
                              ),
                            ),
                          ))
                        : ListView(
                            scrollDirection: Axis.horizontal,
                            children: CardUIBuilderController.getPlaygrounds(
                                nearestPlaygroundsOrCitiesController
                                    .getNearestPlaygroundController(),
                                screenHeight,
                                screenWidth))
                : alertsAndLoadingControllers.getCitiesLoading()
                    ?  Center(child: LoadingWidget())
                    : nearestPlaygroundsOrCitiesController
                            .getCitiesController()
                            .isEmpty
                        ? Center(
                            child: Container(
                            height: viewController.getPortrait(
                                screenHeight / 5, screenWidth / 5),
                            width: viewController.getPortrait(
                                screenWidth / 1.3, screenWidth / 1.3),
                            child: Center(
                              child: CustText(
                                text: "لا توجد مدن متاحة الان",
                                fontSize: viewController.getPortrait(
                                  screenWidth / 25,
                                  screenWidth / 3,
                                ),
                              ),
                            ),
                          ))
                        : ListView(
                            scrollDirection: Axis.horizontal,
                            children: CardUIBuilderController.getTowns(
                                nearestPlaygroundsOrCitiesController
                                    .getCitiesController(),
                                screenHeight,
                                screenWidth),
                          ),
          ),
        ),
        SizedBox(
          height:
              viewController.getPortrait(screenHeight / 40, screenWidth / 40),
        ),
        pGround
            ? Obx(() {
                return ShowMoreButton(
                    pGround: pGround,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    viewController: viewController,
                    playgroundsOrTowns: CardUIBuilderController.getPlaygrounds(
                        nearestPlaygroundsOrCitiesController
                            .getNearestPlaygroundController(),
                        screenHeight,
                        screenWidth));
              })
            : Obx(() {
                return ShowMoreButton(
                    pGround: pGround,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    viewController: viewController,
                    playgroundsOrTowns: CardUIBuilderController.getTowns(
                        nearestPlaygroundsOrCitiesController
                            .getCitiesController(),
                        screenHeight,
                        screenWidth));
              }),
      ],
    );
  }
}
