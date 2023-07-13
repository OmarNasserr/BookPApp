// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:booky/Constant/colors.dart';
import 'package:booky/Screens/HomePage.dart';
import 'package:booky/Widgets/frquent_used_widgets/CustomTextFieldWidget.dart';
import 'package:booky/Widgets/DraggableSheet.dart';
import 'package:booky/Widgets/frquent_used_widgets/GreenBanner.dart';
import 'package:booky/Widgets/SignUp-In%20Button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../Controllers/ConentManagSysControllers/homepageControllers/SliderImageController.dart';
import '../Controllers/UI_Controllers/AlertsAndLoadingControllers.dart';
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            double screenHeight = constraints.maxHeight;
            double screenWidth = constraints.maxWidth;
            Future.delayed(Duration.zero, () async {
              viewController.setPortrait(context);
            });
            return Column(
              children: [
                GreenBanner(
                  text: "تسجيل الدخول",
                ),
                SignInInputForm(
                  formKey: _key, screenWidth: screenWidth, screenHeight: screenHeight,),
                MaterialButton(
                  onPressed: () async{
                    if (_key.currentState!.validate()) {
                      _key.currentState?.save();
                      Get.context!.loaderOverlay.show();
                      await Get.find<SliderImageController>().fetchSliderImages();
                      Get.context!.loaderOverlay.hide();
                      //this is toggled here to make the loading widget appear once the app is redirected to the homepage
                      //if we put the toggle inside the fetch function which is called in the init of the controller
                      //it will appear after the controller is init which makes it lags for less than a sec
                      //but like this no lag
                      Get.find<AlertsAndLoadingControllers>().toggleNearestPlaygroundLoading();
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
