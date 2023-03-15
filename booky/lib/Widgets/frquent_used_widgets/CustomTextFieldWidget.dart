// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputWidget extends StatelessWidget {
  InputWidget({
    required this.dataType,
  });

  final String dataType;
  List<String> hintTexts = [
    "الاسم الكامل",
    "رقم الجوال",
    "اسم الشريك",
    "نسبة هذا الشريك",
    "نوع الاصلاحات"
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          height: screenSize.height / 14,
          width: screenSize.width / 1.2,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: (Colors.green[900])!)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //
              //
              Padding(
                padding: EdgeInsets.all(screenSize.width / 30),
                child: Icon(
                  dataType == "phone no" ? Icons.phone_android : Icons.lock,
                  color: Colors.green[900],
                  size: screenSize.width / 12,
                ),
              ),
              //
              //
              SizedBox(
                height: screenSize.height / 15,
                width: screenSize.width / 2,
                child: TextField(
                  onChanged: (changed) {},
                  maxLength: 25,
                  style: TextStyle(color: Colors.green[900]),
                  decoration: InputDecoration(
                    counterText: "",
                    hintText:
                        dataType == "phone no" ? hintTexts[1] : hintTexts[1],
                    //
                    hintStyle: TextStyle(
                        fontSize: screenSize.width / 20,
                        color: Colors.grey[200]),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenSize.height / 30,
        ),
      ],
    );
  }
}
