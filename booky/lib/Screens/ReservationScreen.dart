import 'dart:developer';

import 'package:booky/Screens/ConfirmPayment.dart';
import 'package:booky/Widgets/frquent_used_widgets/HeadLine.dart';
import 'package:booky/Widgets/ReservationPage/HourRateAndButton.dart';
import 'package:calender_picker/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controllers/PlaygroundController/PlaygroundDetailsByIdController.dart';
import '../Controllers/ReservationControllers/ReservationAPIs.dart';
import '../Controllers/ReservationControllers/ReservationUI.dart';
import '../Controllers/TimeControllers/TimeController.dart';
import '../Controllers/UI_Controllers/AlertsAndLoadingControllers.dart';
import '../Controllers/ViewController/ViewController.dart';
import '../Widgets/ReservationPage/AvailableTimes.dart';
import '../Widgets/frquent_used_widgets/LoadingWidget.dart';

class Reservation extends StatelessWidget {
  ViewController viewController = Get.find<ViewController>();
  ReservationUI reservationUI = Get.find<ReservationUI>();
  ReservationAPIs reservationAPIs = Get.find<ReservationAPIs>();
  final double hourRate;
  final List<String> availableHours;
  final String id;

  Reservation({Key? key,
    required this.hourRate,
    required this.availableHours,
    required this.id});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          double screenHeight = constraints.maxHeight;
          double screenWidth = constraints.maxWidth;
          WidgetsBinding.instance!.addPostFrameCallback((_)  {
            viewController.setPortrait(context);
          });
          return SingleChildScrollView(
            child: Column(
              children: [
                HeadLine(
                    viewController: viewController,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    headline: "احجز معادك"),
                CalenderPicker(
                  DateTime.now(),
                  dateTextStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: viewController.getPortrait(
                          screenWidth / 15, screenHeight / 15)),
                  locale: "ar_EG",
                  dayTextStyle: GoogleFonts.tajawal(
                      textStyle: TextStyle(
                          fontSize: viewController.getPortrait(
                              screenWidth / 30, screenHeight / 30))),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.green[900]!,
                  selectedTextColor: Colors.white,
                  daysCount: 15,
                  onDateChange: (date) async {
                    ///
                    await Get.find<ReservationAPIs>()
                        .onDateChange(date, id);
                    ///
                  },
                ),
                SizedBox(
                  height: viewController.getPortrait(
                      screenHeight / 40, screenWidth / 40),
                ),
                HeadLine(
                    viewController: viewController,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    fontDiv1: 15,
                    fontDiv2: 25,
                    headline: "المواعيد المتاحة"),
                Container(
                  height: viewController.getPortrait(
                      screenHeight / 2, screenWidth / 1.48),
                  width: viewController.getPortrait(
                      screenWidth / 1.1, screenWidth / 1.1),
                  child: SingleChildScrollView(
                    child: Obx(() {
                      return Column(
                        children: Get.find<AlertsAndLoadingControllers>()
                            .getAvailableHoursLoading() ? [ Center(
                          child: LoadingWidget(),
                        )
                        ] : reservationUI.setAvailableTimes(screenHeight, screenWidth,
                            Get.find<ReservationAPIs>()
                                .getAvailableReservationTimes(),viewController,hourRate),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: viewController.getPortrait(
                      screenHeight / 40, screenWidth / 40),
                ),
                Obx(
                      () =>
                      HourRateAndButton(
                        hourRate: Get
                            .find<ReservationUI>()
                            .totalPay
                            .value,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        textBelowHour: 'التكلفة',
                        buttonText: 'اكد الحجز',
                        viewController: viewController,
                        onTap: () {
                          Get.to(() => ConfirmPayment());
                        },
                      ),
                ),
                SizedBox(
                  height: viewController.getPortrait(
                      screenHeight / screenHeight, screenWidth / 40),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
