import 'package:booky/Widgets/frquent_used_widgets/HeadLine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constant/colors.dart';
import '../Controllers/UI_Controllers/CardUI_BuilderController.dart';
import '../Controllers/ViewController/ViewController.dart';
import '../Widgets/HomePage/PlaygroundCard.dart';
import '../Widgets/frquent_used_widgets/backArrowIOS.dart';

class NearestPGrounds extends StatelessWidget {
  NearestPGrounds(
      {Key? key, required this.screenHeight, required this.screenWidth, required this.playgrounds});
//
  final double screenHeight;
  final double screenWidth;
  final List<Widget> playgrounds;
  //
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              double screenHeight = constraints.maxHeight;
              double screenWidth = constraints.maxWidth;
              Future.delayed(Duration.zero, () async {
                viewController.setPortrait(context);
              });
              return SingleChildScrollView(
                child: SizedBox(
                  width: viewController.getPortrait(screenWidth, screenWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: viewController.getPortrait(
                            screenHeight / 60, screenWidth / 60),
                      ),
                      HeadLine(
                          viewController: viewController,
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          headline: "اقـــرب الملاعـــب"),
                      SizedBox(
                        height: viewController.getPortrait(
                            screenHeight / 60, screenWidth / 60),
                      ),
                      Container(
                        height: viewController.getPortrait(
                            viewController.getPlatform()
                                ? screenHeight / 1.17
                                : screenHeight / 1.1,
                            screenHeight / 1.45),
                        width: viewController.getPortrait(
                            screenWidth / 1.1, screenWidth / 1.1),
                        child: ListView(
                          children: CardUIBuilderController.setPlaygroundsRows(
                              playgrounds,
                              viewController,
                              screenHeight,
                              screenWidth),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
