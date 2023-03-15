import 'dart:io';

import 'package:booky/Constant/colors.dart';
import 'package:booky/Widgets/frquent_used_widgets/CustText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class Button extends StatelessWidget {
  Button({
    required this.text,
    required this.onPressed,
    required this.height,
    required this.width,
  });

  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: height/21.98,
      color: secondaryColor,
      minWidth: 300,
      child: CustText(
        text: text,
        fontSize: width / 20.45,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
    //   MaterialButton(
    //   onPressed: onPressed,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(width / 10),
    //   ),
    //   color: secondaryColor,
    //   minWidth: width / 1.5,
    //   height: height / 12,
    //   child: CustText(text: text, fontSize: width / 15,)
    // );

  }
}