import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/ViewController/ViewController.dart';
import '../Widgets/frquent_used_widgets/CustText.dart';
import '../Widgets/frquent_used_widgets/HeadLine.dart';
import '../Widgets/HomePage/PlaygroundCard.dart';
import '../Widgets/frquent_used_widgets/backArrowIOS.dart';

class Cities extends StatelessWidget {
  Cities(
      {Key? key,
      required this.screenHeight,
      required this.screenWidth,
      required this.towns});

  final double screenHeight;
  final double screenWidth;
  final List<Widget> towns;

  //

  ViewController viewController = Get.find<ViewController>();

  List<Widget> setPGRow(List<Widget> pGroundCards) {
    List<Widget> pRows = [];
    List<Widget> pgTemp = [];
    int count = 0;
    for (int i = 0; i < pGroundCards.length; i++) {
      count++;
      pgTemp.add(pGroundCards[i]);
      if (count % viewController.getPortrait(2, 4) == 0) {
        pRows.add(
          Container(
            height: viewController.getPortrait(
                screenHeight / 3.5, screenHeight / 3.5),
            child: Row(
              children: pgTemp,
            ),
          ),
        );
        pgTemp = [];
      } else if (pgTemp.isNotEmpty && count == pGroundCards.length) {
        pRows.add(
          Container(
            height: viewController.getPortrait(
                screenHeight / 3.5, screenHeight / 3.5),
            child: Center(
              child: Row(
                children: pgTemp,
              ),
            ),
          ),
        );
      }
    }
    return pRows;
  }

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
                          headline: "اقـــرب المدن"),
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
                          children: towns.length == 0
                              ? [
                                  Center(
                                    child: CustText(
                                      text: "لا توجد مدن متاحة الان",
                                      fontSize: viewController.getPortrait(
                                        screenWidth / 25,
                                        screenWidth / 3,
                                      ),
                                    ),
                                  )
                                ]
                              : setPGRow(towns),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
