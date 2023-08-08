import 'package:booky/Screens/ReservationScreen.dart';
import 'package:booky/Widgets/frquent_used_widgets/CustText.dart';
import 'package:booky/Widgets/frquent_used_widgets/HeadLine.dart';
import 'package:booky/Widgets/frquent_used_widgets/ImageSlider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constant/colors.dart';
import '../Controllers/ViewController/ViewController.dart';
import '../Widgets/ReservationPage/HourRateAndButton.dart';
import '../Widgets/frquent_used_widgets/backArrowIOS.dart';

class PlaygroundDetails extends StatelessWidget {
  PlaygroundDetails(
      {Key? key,
      required this.pName,
      required this.screenWidth,
      required this.hourRate, required this.images,
        required this.description, required this.availableHours, required this.id});
  final String pName;
  final double screenWidth;
  final double hourRate;
  final List<String> images;
  final List<String> availableHours;
  final String description;
  final String id;

  ViewController viewController = Get.find<ViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: viewController.getPlatform()
              ? Size.fromHeight(0)
              : Size.fromHeight(screenWidth / 8),
          child: backArrow(),
        ),
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            double screenHeight = constraints.maxHeight;
            double screenWidth = constraints.maxWidth;
            WidgetsBinding.instance!.addPostFrameCallback((_)  {
              viewController.setPortrait(context);
            });
            return SingleChildScrollView(
              child: SizedBox(
                width: screenWidth,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: screenWidth,
                        child: Center(
                          child: ImageSlider(
                            screenHeight: viewController.getPortrait(
                                screenHeight * 1.5, screenWidth * 1.5),
                            images: images,
                            screenWidth: viewController.getPortrait(
                                screenWidth, screenWidth / 1.2),
                          ),
                        ),
                      ),
                      SizedBox(
                        height:
                            viewController.getPortrait(0, screenHeight / 20),
                      ),
                      HeadLine(
                        viewController: viewController,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        headline: pName,
                        fontDiv1: 12,
                        fontDiv2: 20,
                      ),
                      SizedBox(
                        height: viewController.getPortrait(
                            screenHeight / 4, screenWidth / 5),
                        width: viewController.getPortrait(
                            screenWidth / 1.1, screenWidth / 1.2),
                        child: SingleChildScrollView(
                          child: Text(description,
                            textDirection: TextDirection.rtl,
                            style: GoogleFonts.tajawal(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: viewController.getPortrait(
                                      screenWidth / 20,
                                      screenHeight / 20,
                                    ))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: viewController.getPortrait(
                            screenHeight / 12, screenWidth / 12),
                      ),
                      HourRateAndButton(
                        viewController: viewController,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        textBelowHour: "في الساعة",
                        buttonText: "احجـــز",
                        hourRate: hourRate,
                        onTap: () {
                          Get.to(() => Reservation(hourRate: hourRate, availableHours: availableHours, id: id,));
                        },
                      ),
                      SizedBox(
                        height: viewController.getPortrait(0, screenWidth / 10),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
