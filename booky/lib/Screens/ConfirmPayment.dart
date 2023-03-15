import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/GeoLocationControllers/GeoLocationAPIs.dart';

class ConfirmPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                await Get.find<GeoLocationAPIs>().determinePosition();
              },
              child: Container(
                height: 200,
                width: 200,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
