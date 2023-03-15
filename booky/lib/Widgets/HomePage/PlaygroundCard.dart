import 'package:booky/Controllers/PlaygroundController/FilterPlaygroundsController.dart';
import 'package:booky/Controllers/PlaygroundController/PlaygroundDetailsByIdController.dart';
import 'package:booky/Screens/Cities.dart';
import 'package:booky/Screens/Playgrounds_in_city.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../Controllers/ReservationControllers/ReservationAPIs.dart';
import '../../Controllers/TimeControllers/TimeController.dart';
import '../../Controllers/UI_Controllers/CardUI_BuilderController.dart';
import '../../Controllers/ViewController/ViewController.dart';
import '../../Screens/PlaygroundDetails.dart';
import '../frquent_used_widgets/CustText.dart';
import '../frquent_used_widgets/ImgFromUrlWithShimmer.dart';

class PlaygroundCard extends StatelessWidget {
  PlaygroundCard({
    required this.screenHeight,
    required this.screenWidth,
    required this.pName,
    required this.imgThumbnail,
    this.city = false,
    this.hourRate = 0,
    required this.id,
  });

  ViewController viewController = Get.find<ViewController>();
  final double screenHeight;
  final double screenWidth;
  final String pName;
  final String imgThumbnail;
  final bool city;
  final double hourRate;
  final String id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!city) {
          var playgroundDetail =
              await Get.find<ReservationAPIs>().onSelectingPlayground(id);

          List<String> imagesUrls = [];
          for (int i = 0; i < playgroundDetail.value.images.length; i++) {
            imagesUrls.add(playgroundDetail.value.images[i].image);
          }
          Get.to(() => PlaygroundDetails(
                pName: pName,
                screenWidth: screenWidth,
                hourRate: hourRate,
                images: imagesUrls,
                description: playgroundDetail.value.description,
                availableHours: playgroundDetail.value.hoursAvaialble,
                id: id,
              ));
          context.loaderOverlay.hide();
        } else {
          await Get.find<FilterPlaygroundsController>().filterPlaygrounds(
            pageNumber: 1,
            pageSize: 10,
            cityName: pName,
          );
          Get.to(() => PlaygroundsInCity(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                playgrounds: CardUIBuilderController.getPlaygrounds(
                  Get.find<FilterPlaygroundsController>().getFilterPlaygroundController(),
                  screenHeight,screenWidth,showAll: true
                ),
                cityName: pName,
              ));
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Container(
          height: viewController.getPortrait(screenHeight / 4, screenWidth / 4),
          width:
              viewController.getPortrait(screenWidth / 2.5, screenHeight / 2.5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: viewController.getPortrait(
                    screenHeight / 6, screenWidth / 6),
                width: viewController.getPortrait(
                    screenWidth / 2, screenHeight / 2),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  child: !city
                      ? ImgFromNetwork(
                          imgUrl: imgThumbnail,
                          boxFit: BoxFit.cover,
                        )
                      : Image.asset(
                          'Assets/Images/greenPlayground.jpg',
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(
                height: screenHeight / 150,
              ),
              Center(
                child: SizedBox(
                  height: viewController.getPortrait(
                      screenHeight / 16, screenWidth / 16),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: CustText(
                        text: pName,
                        fontSize: viewController.getPortrait(
                            screenWidth / 18, screenHeight / 20),
                        color: Colors.black,
                        overflow: true,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
