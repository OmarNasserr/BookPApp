import 'package:booky/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controllers/UI_Controllers/SideDrawerController.dart';
import '../../Controllers/ViewController/ViewController.dart';
import '../frquent_used_widgets/CustText.dart';
import 'IconInsideCircle.dart';

  class SideDrawer extends StatelessWidget {
    ViewController viewController = Get.find<ViewController>();
    final GlobalKey<ScaffoldState> scaffoldKey;

    SideDrawer({required this.scaffoldKey});

    @override
    Widget build(BuildContext context) {
      final Size size = MediaQuery.of(context).size;
      return Container(
          color: secondaryColor,
          height: size.height,
          width: size.width / 1.2,
          child: Column(children: [
            Container(
              height: size.height / 1.3,
              width: size.width / 1.4,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height / 14.9,
                  ),
                  Column(
                    children: SideDrawerController.sideMenuTiles(context),
                  ),

                ],
              ),
            ),
          SizedBox(
            height: size.height / 56.9,
          ),
          Container(
            height: size.height/5,
            child: Column(
              children: [
                Container(
                  height: size.height / 27.33,
                  width: size.width / 1.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconInsideCircle(
                          viewController: viewController,
                          screenHeight: size.height,
                          screenWidth: size.width,
                          widthDiv: 12,
                          iconData: 'Assets/Icons/et_facebook.svg',
                          iconData2: 'Assets/Icons/et_facebook.svg',
                          changeIconColor: true,
                          iconActive: true,
                          // differentColor: iconCircleColor,
                          // circleColor: sideMenuColor,
                          onTap: () {}),
                      SizedBox(
                        width: size.width / 11,
                      ),
                      IconInsideCircle(
                          viewController: viewController,
                          screenHeight: size.height,
                          screenWidth: size.width,
                          widthDiv: 12,
                          iconData: 'Assets/Icons/et_twitter.svg',
                          iconData2: 'Assets/Icons/et_twitter.svg',
                          changeIconColor: true,
                          iconActive: true,
                          // differentColor: iconCircleColor,
                          // circleColor: sideMenuColor,
                          onTap: () {}),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height / 60,
                ),
                Container(
                  height: size.height / 27.33,
                  width: size.width / 1.2,
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustText(
                        text: 'Terms & Conditions',
                        fontSize: size.width / 30,
                        fontType: GoogleFonts.dmSans,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                        // color: iconCircleColor,
                      ),
                      CustText(
                        text: ' and ',
                        fontSize: size.width / 30,
                        fontType: GoogleFonts.dmSans,
                        fontWeight: FontWeight.w700,
                      ),
                      CustText(
                        text: 'Privacy Policy',
                        fontSize: size.width / 30,
                        fontType: GoogleFonts.dmSans,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                        // color: iconCircleColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height / 80,
                ),
                Container(
                  height: size.height / 27.33,
                  width: size.width / 1.2,
                  // color: Colors.red,
                  child: Center(
                    child: CustText(
                      text: 'App Version - V 0.0.1',
                      fontSize: size.width / 30,
                      fontType: GoogleFonts.dmSans,
                      fontWeight: FontWeight.w700,
                      // color: iconCircleColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
