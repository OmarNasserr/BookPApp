import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/PlaygroundController/FilterPlaygroundsController.dart';
import '../../Controllers/PlaygroundController/NearestPlaygroundController.dart';
import '../../Controllers/ViewController/ViewController.dart';
import '../../Widgets/HomePage/SectionListView.dart';
import '../../Widgets/PlaygroundOwner/OwnerPgSectionView.dart';

class AdminPlaygrounds extends StatelessWidget {
  ViewController viewController = Get.find<ViewController>();
  FilterPlaygroundsController filterPlaygroundsController =
      Get.find<FilterPlaygroundsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        double screenHeight = constraints.maxHeight;
        double screenWidth = constraints.maxWidth;
        WidgetsBinding.instance!.addPostFrameCallback((_)  {
          viewController.setPortrait(context);
        });
        return SingleChildScrollView(
          child: Column(
            children: [
              OwnerSectionListView(
                viewController: viewController,
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                headline: "مـــلاعــبــــــي",
              ),
            ],
          ),
        );
      }),
    ));
  }
}
