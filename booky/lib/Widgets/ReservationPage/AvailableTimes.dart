import 'package:booky/Widgets/frquent_used_widgets/CustText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/ReservationControllers/ReservationUI.dart';
import '../../Controllers/ViewController/ViewController.dart';

class AvailableTimes extends StatefulWidget {
  AvailableTimes({
    required this.viewController,
    required this.screenHeight,
    required this.screenWidth,
    required this.time1,
    required this.hourRate,
  });

  final ViewController viewController;
  final double screenHeight;
  final double screenWidth;
  final String time1;
  final double hourRate;

  @override
  State<AvailableTimes> createState() => _AvailableTimesState();
}

class _AvailableTimesState extends State<AvailableTimes> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
            if (!selected) {
              Get.find<ReservationUI>().decTotalPay(widget.hourRate);
            } else {
              Get.find<ReservationUI>().incTotalPay(widget.hourRate);
            }
          },
          child: Container(
            height: widget.viewController
                .getPortrait(widget.screenHeight / 15, widget.screenWidth / 15),
            width: widget.viewController.getPortrait(
                widget.screenWidth / 1.1, widget.screenWidth / 1.1),
            decoration: BoxDecoration(
              color: selected ? Colors.green[800] : Colors.white,
              borderRadius: BorderRadius.circular(widget.viewController
                  .getPortrait(
                      widget.screenWidth / 7, widget.screenWidth / 10)),
            ),
            child: Center(
              child: SizedBox(
                width: widget.screenWidth / 1.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustText(
                      text: widget.time1,
                      fontSize: widget.viewController.getPortrait(
                          widget.screenWidth / 15, widget.screenWidth / 20),
                      color: selected ? Colors.white : Colors.blueGrey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: widget.viewController
              .getPortrait(widget.screenHeight / 50, widget.screenWidth / 50),
        ),
      ],
    );
  }
}
