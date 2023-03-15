import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constant/colors.dart';
import '../../Controllers/ViewController/ViewController.dart';

class searchBar extends StatelessWidget {
  searchBar({
    required this.viewController,
    required this.screenHeight,
    required this.screenWidth,
    required this.iconData,
    required this.onTap,
    required this.onChanged,
    required this.onSubmitted,
  });

  final ViewController viewController;
  final double screenHeight;
  final double screenWidth;
  final IconData iconData;
  final VoidCallback onTap;
  final Function(String) onChanged;
  final Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: viewController.getPortrait(screenHeight / 15, screenWidth / 15),
      width: viewController.getPortrait(screenWidth, screenWidth / 1.4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(viewController.getPortrait(
            screenWidth / 11.25, screenHeight / 10.375)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(
            width:
                viewController.getPortrait(screenWidth / 30, screenHeight / 30),
          ),
          MaterialButton(
            minWidth: 0,
            height: 0,
            padding: EdgeInsets.zero,
            onPressed: onTap,
            child: Material(
              elevation: viewController.getPortrait(
                  screenWidth / 36, screenHeight / 33.2),
              borderRadius: BorderRadius.circular(viewController.getPortrait(
                  screenWidth / 7.2, screenHeight / 6.64)),
              child: Container(
                height: viewController.getPortrait(
                    screenHeight / 18, screenWidth / 18),
                width: viewController.getPortrait(
                    screenWidth / 8, screenHeight / 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(viewController
                      .getPortrait(screenWidth / 7.2, screenHeight / 6.64)),
                ),
                child: Icon(
                  iconData,
                  size: viewController.getPortrait(
                      screenWidth / 13, screenHeight / 13),
                  color: secondaryColor,
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: viewController.getPortrait(
                    screenHeight / 45, screenWidth / 45),
              ),
              Container(
                height: viewController.getPortrait(
                    screenHeight / 23, screenWidth / 23),
                width: viewController.getPortrait(
                    screenWidth / 1.3, screenWidth / 1.7),
                child: TextField(
                  onChanged: onChanged,
                  onSubmitted: onSubmitted,
                  maxLength: 20,
                  textInputAction: TextInputAction.search,
                  cursorHeight: viewController.getPortrait(
                      screenHeight / 35, screenWidth / 35),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: "...ابحـــث عن ملعـــب",
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.tajawal(
                        textStyle: TextStyle(
                            fontSize: viewController.getPortrait(
                                screenHeight / 40, screenWidth / 40),
                            color: Colors.grey[400]),
                      )),
                  style: GoogleFonts.tajawal(
                      textStyle: TextStyle(
                          fontSize: viewController.getPortrait(
                              screenHeight / 40, screenWidth / 40),
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
