import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constant/colors.dart';

class backArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: background,
      leading: MaterialButton(
        onPressed: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
