import 'package:booky/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../Controllers/ViewController/ViewController.dart';
import '../frquent_used_widgets/CustText.dart';
import 'IconInsideCircle.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    Key? key,
    required this.size,
    required this.viewController,
    required this.iconData,
    this.notificationNo = '',
    required this.tileText,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final ViewController viewController;
  final String iconData;
  final String notificationNo;
  final String tileText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          height: 0,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: onPressed,
          child: Container(
            height: size.height / 32,
            width: size.width / 1.6,
            // color: Colors.red,
            child: Row(
              children: [
                IconInsideCircle(
                    viewController: viewController,
                    screenHeight: size.height,
                    screenWidth: size.width,
                    widthDiv: 14,
                    iconData: iconData,
                    iconData2: iconData,
                    changeIconColor: true,
                    iconActive: true,
                    differentColor: Colors.black,
                    circleColor: sideDrawerTileCircleColor,
                    onTap: () {}),
                SizedBox(
                  width: size.width / 22,
                ),
                Container(
                  height: size.height / 41,
                  width: size.width / 2.5,
                  child: CustText(
                    text: tileText,
                    fontSize: size.width / 25.7,
                    fontWeight: FontWeight.w700,
                    fontType: GoogleFonts.dmSans,
                    color: sideDrawerTileTextColor,
                  ),
                ),
                SizedBox(
                  width: size.width / 20,
                ),
                notificationNo != ''
                    ? Container(
                        height: size.height / 41,
                        width: size.width / 18,
                        decoration: BoxDecoration(
                            color: sideDrawerTileNotificationColor,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: CustText(
                            text: notificationNo,
                            color: sideDrawerTileNotNumColor,
                            fontSize: size.width / 36,
                            fontWeight: FontWeight.w700,
                            fontType: GoogleFonts.dmSans,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height / 30,
        )
      ],
    );
  }
}
