import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;

class ViewController extends GetxController {
  RxBool portrait = true.obs;

  ///this function is used inside the LayoutBuilder widget which keeps track of the
  ///orientation of the device, so when we return the values of Screen Height and Width we get the
  ///updated true values of current orientation
  void setPortrait(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      Get.find<ViewController>().portrait.value = true;
      Get.find<ViewController>().portrait.refresh();
    } else {
      Get.find<ViewController>().portrait.value = false;
      Get.find<ViewController>().portrait.refresh();
    }
  }

  ///this function decides which value to return, the first is the value when the mobile device is in Portrait mode
  ///and the second is the value when the mobile device is in the Landscape mode
  double getPortrait(double first, double second) {
    if (Get.find<ViewController>().portrait.value) {
      return first;
    } else {
      return second;
    }
  }
  ///////

  /// this function to know the operating system of the device, this is used
  /// to show an app bar with a back arrow as IOS doesn't have back option
  bool android = true.obs();
  bool getPlatform() {
    if (Platform.isAndroid) {
      Get.find<ViewController>().android = true;
    } else if (Platform.isIOS) {
      Get.find<ViewController>().android = false;
    }
    return Get.find<ViewController>().android;
  }
}
