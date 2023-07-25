import 'dart:developer';

import 'package:booky/Constant/colors.dart';
import 'package:booky/Controllers/ConentManagSysControllers/homepageControllers/SliderImageController.dart';
import 'package:booky/Controllers/LocationControllers/CitiesController.dart';
import 'package:booky/Controllers/UI_Controllers/AlertsAndLoadingControllers.dart';
import 'package:booky/Widgets/frquent_used_widgets/CustText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/GeoLocationControllers/GeoLocationAPIs.dart';
import '../Controllers/PlaygroundController/NearestPlaygroundController.dart';
import '../Controllers/ViewController/ViewController.dart';
import '../Widgets/frquent_used_widgets/ImageSlider.dart';
import '../Widgets/HomePage/SearchBar.dart';
import '../Widgets/HomePage/SectionListView.dart';

class HomePage extends StatelessWidget {
  var b = Get.put(NearestPlaygroundsController());
  var c = Get.put(CitiesController());
  ViewController viewController = Get.find<ViewController>();
  NearestPlaygroundsController nearestPlaygroundsController =
      Get.find<NearestPlaygroundsController>();
  CitiesController citiesController = Get.find<CitiesController>();
  SliderImageController sliderImageController =
      Get.find<SliderImageController>();

  double range = 0;

  @override
  Widget build(BuildContext context) {
    log("HOME");
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            double screenHeight = constraints.maxHeight;
            double screenWidth = constraints.maxWidth;
            viewController.setPortrait(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: viewController.getPortrait(
                        screenHeight / 100, screenWidth / 100),
                  ),
                  searchBar(
                    viewController: viewController,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    iconData: Icons.search,
                    onSubmitted: (String str) {
                      debugPrint("STRRR $str");
                    },
                    onTap: () {},
                    onChanged: (String str) {
                      debugPrint(str);
                    },
                  ),
                  SizedBox(
                    height: viewController.getPortrait(
                        screenHeight / 100, screenWidth / 100),
                  ),
                  SizedBox(
                    width: screenWidth,
                    child: Center(
                      child: Obx(
                        () => sliderImageController
                                    .getSliderImagesController().isEmpty
                            ? Container()
                            : ImageSlider(
                                screenHeight: viewController.getPortrait(
                                    screenHeight, screenWidth / 1.2),
                                screenWidth: viewController.getPortrait(
                                    screenWidth, screenWidth / 1.4),
                                // ignore: prefer_const_literals_to_create_immutables
                                images: sliderImageController
                                            .getSliderImagesController().isEmpty
                                    ? []
                                    : sliderImageController
                                        .getSliderImagesController()),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: viewController.getPortrait(
                        screenHeight / 30, screenWidth / 30),
                  ),
                  Container(
                    height: viewController.getPortrait(
                        screenHeight / 25, screenWidth / 30),
                    width: viewController.getPortrait(
                        screenWidth / 1.1, screenWidth / 1.4),
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
                                var location = await Get.find<GeoLocationAPIs>()
                                    .determinePosition();
                                var passedLocation =
                                    "${location.latitude.toString()},${location.longitude.toString()}";
                                await nearestPlaygroundsController
                                    .fetchPlaygrounds(
                                        location: passedLocation,
                                        distance: nearestPlaygroundsController
                                            .getDistance()
                                            .toInt());
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
                  ),
                  SectionListView(
                    viewController: viewController,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    headline: "اقـــرب الملاعـــب",
                    nearestPlaygroundsOrCitiesController:
                        nearestPlaygroundsController,
                  ),
                  SectionListView(
                      viewController: viewController,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      headline: "الــــمـدن",
                      pGround: false,
                      nearestPlaygroundsOrCitiesController: citiesController),
                  SizedBox(
                    height: viewController.getPortrait(
                        screenHeight / 15, screenWidth / 15),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Container(
                      height: viewController.getPortrait(
                          screenHeight / 4, screenWidth / 4),
                      width: viewController.getPortrait(
                          screenWidth / 1.2, screenWidth / 2.3),
                      child: Image.asset(
                        "Assets/Images/Missed chances.gif",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
