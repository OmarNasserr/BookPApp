import 'dart:developer';

import 'package:booky/Controllers/ViewController/ViewController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/ReservationPage/AvailableTimes.dart';

class ReservationUI extends GetxController {
  ///
  Rx<double> totalPay = 0.0.obs;

  ///
  void incTotalPay(double hourRate) {
    Get.find<ReservationUI>().totalPay =
        Get.find<ReservationUI>().totalPay + hourRate;
    Get.find<ReservationUI>().totalPay.refresh();
    debugPrint("toalPay ${Get.find<ReservationUI>().totalPay}");
  }

  void decTotalPay(double hourRate) {
    Get.find<ReservationUI>().totalPay =
        Get.find<ReservationUI>().totalPay - hourRate;
    Get.find<ReservationUI>().totalPay.refresh();
    debugPrint("toalPay ${Get.find<ReservationUI>().totalPay}");
  }

  void restartTotalPayToZero(){
    Get.find<ReservationUI>().totalPay.value =0;
    Get.find<ReservationUI>().totalPay.refresh();
  }

  List<Widget> setAvailableTimes(double screenHeight, double screenWidth,
      List<String> availableHoursPassed,ViewController viewController,double hourRate) {
    List<Widget> availableTimes = [];
    log("$availableHoursPassed");
    for (int i = 0; i < availableHoursPassed.length; i++) {
      availableTimes.add(
        AvailableTimes(
          viewController: viewController,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          time1: availableHoursPassed[i],
          hourRate: hourRate,
        ),
      );
    }
    return availableTimes;
  }

  ///
}
