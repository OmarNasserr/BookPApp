// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:booky/Constant/colors.dart';
import 'package:booky/Screens/HomePage.dart';
import 'package:booky/Widgets/frquent_used_widgets/CustomTextFieldWidget.dart';
import 'package:booky/Widgets/DraggableSheet.dart';
import 'package:booky/Widgets/frquent_used_widgets/GreenBanner.dart';
import 'package:booky/Widgets/SignUp-In%20Button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/ViewController/ViewController.dart';
import '../Widgets/Policy.dart';
import '../Widgets/SignIn-Up/SignInInputForm.dart';
import '../Widgets/frquent_used_widgets/CustText.dart';

class SignIn extends StatelessWidget {
  var a = Get.put(ViewController());
  ViewController viewController = Get.find<ViewController>();
  static final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            double screenHeight = constraints.maxHeight;
            double screenWidth = constraints.maxWidth;
            Future.delayed(Duration.zero, () async {
              viewController.setPortrait(context);
            });
            viewController.setPortrait(context);
            return Column(
              children: [
                GreenBanner(
                  text: "تسجيل الدخول",
                ),
                SignInInputForm(
                  formKey: _key, screenWidth: screenWidth, screenHeight: screenHeight,),
                MaterialButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      _key.currentState?.save();
                      Get.to(()=>HomePage());
                    }
                  },
                  height: screenHeight/21.98,
                  color: secondaryColor,
                  minWidth: 300,
                  child: CustText(
                    text: 'تسجيل الدخول',
                    fontSize: screenWidth / 20.45,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            );
          })),
    );
  }
}
