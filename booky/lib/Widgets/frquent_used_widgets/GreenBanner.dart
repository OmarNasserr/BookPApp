import 'package:booky/Widgets/frquent_used_widgets/CustText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constant/colors.dart';

class GreenBanner extends StatelessWidget {
  final String text;

  const GreenBanner({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height / 4,
      width: screenSize.width,
      color: background,
      child: Column(
        children: [
          SizedBox(
            height: screenSize.height / 20,
          ),
          Container(
            height: screenSize.height/10,
            width: screenSize.width/1.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: screenSize.width / 20,
                ),
                Center(
                  child: SizedBox(
                    height: screenSize.height / 10,
                    width: screenSize.width / 2.2,
                    child: Row(
                      children: [
                        CustText(text: text, fontSize: screenSize.width / 15,color: textColor,),

                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SizedBox(
                    height: screenSize.height / 20,
                    width: screenSize.width / 12,
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: textColor,
                          size: screenSize.width / 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
