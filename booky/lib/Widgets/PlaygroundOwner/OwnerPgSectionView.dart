import 'package:booky/Controllers/LocationControllers/CitiesController.dart';
import 'package:booky/Controllers/PlaygroundController/FilterPlaygroundsController.dart';
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
import '../HomePage/ShowMoreButton.dart';
import '../frquent_used_widgets/CustText.dart';
import '../frquent_used_widgets/HeadLine.dart';
import '../frquent_used_widgets/LoadingWidget.dart';

class OwnerSectionListView extends StatelessWidget {
  OwnerSectionListView({
    required this.viewController,
    required this.screenHeight,
    required this.screenWidth,
    required this.headline,
    this.pGround = true,
    this.ownerOrDetails = false,
  });

  final ViewController viewController;
  final double screenHeight;
  final double screenWidth;
  final String headline;
  final bool pGround;
  final bool ownerOrDetails;

  ///if true shows playgrounds, if false shows cities
  FilterPlaygroundsController filteredPlaygroundsController=Get.find<FilterPlaygroundsController>();

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
              child: alertsAndLoadingControllers.playgroundFilterLoading()
                  ? Center(child: LoadingWidget())
                  : filteredPlaygroundsController
                          .getFilterPlaygroundController()
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
                                  "لا توجد ملاعب في هذا النطاق\n       برجاء توسيع النطاق",
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
                              filteredPlaygroundsController
                                  .getFilterPlaygroundController(),
                              screenHeight,
                              screenWidth))),
        ),
        SizedBox(
          height:
              viewController.getPortrait(screenHeight / 40, screenWidth / 40),
        ),
        Obx(() {
          return ShowMoreButton(
              pGround: pGround,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              viewController: viewController,
              playgroundsOrTowns: CardUIBuilderController.getPlaygrounds(
                  filteredPlaygroundsController
                      .getFilterPlaygroundController(),
                  screenHeight,
                  screenWidth));
        })
      ],
    );
  }
}
