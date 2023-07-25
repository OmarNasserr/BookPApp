import 'package:booky/Screens/SignIn.dart';
import 'package:booky/Widgets/SignUp-In%20Button.dart';
import 'package:booky/Widgets/frquent_used_widgets/CustText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/ViewController/ViewController.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("Assets/Images/salah.gif"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent.withOpacity(0.5),
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            double screenHeight = constraints.maxHeight;
            double screenWidth = constraints.maxWidth;
            Future.delayed(Duration.zero, () async {
              Get.find<ViewController>().setPortrait(context);
            });
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: screenHeight / 3,
                    width: screenWidth,
                  ),
                  SizedBox(
                    height: screenHeight / 30,
                  ),
                  Container(
                    width: screenWidth,
                    height: screenHeight / 4.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          child: CustText(
                            text: "مرحبا بك في تــرتـان",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth / 15,
                          ),
                        ),
                        Center(
                          child: CustText(
                              text: "اول تطبيق حجز ملاعب في مصر",
                              color: Colors.white,
                              fontSize: screenWidth / 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.find<ViewController>().portrait.value
                        ? screenHeight / 40
                        : screenWidth / 20,
                  ),
                  Button(
                    width: Get.find<ViewController>().portrait.value
                        ? screenWidth
                        : screenHeight,
                    height: Get.find<ViewController>().portrait.value
                        ? screenHeight
                        : screenWidth,
                    text: "تسجيل الدخول",
                    onPressed: () {
                      Get.to(() => SignIn());
                    },
                  ),
                  SizedBox(
                    height: screenHeight / 50,
                  ),
                  Button(
                    width: Get.find<ViewController>().portrait.value
                        ? screenWidth
                        : screenHeight,
                    height: Get.find<ViewController>().portrait.value
                        ? screenHeight
                        : screenWidth,
                    text: "الاشتــراك",
                    onPressed: () {

                    },
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
