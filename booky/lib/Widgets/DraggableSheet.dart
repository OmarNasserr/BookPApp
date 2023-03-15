import 'package:flutter/material.dart';

import 'SignIn-Up/SignInInputForm.dart';
import 'frquent_used_widgets/CustomTextFieldWidget.dart';
import 'Policy.dart';
import 'SignUp-In Button.dart';

class DraggableSheet extends StatelessWidget {
  const DraggableSheet({Key? key, required this.imgPath}) : super(key: key);

  final String imgPath;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return DraggableScrollableSheet(
      initialChildSize: 0.78,
      maxChildSize: 0.85,
      minChildSize: 0.78,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          height: screenSize.height,
          width: screenSize.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenSize.width / 10),
                topRight: Radius.circular(screenSize.width / 10),
              )),
          child: ListView.builder(
            controller: scrollController,
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  SizedBox(
                    height: screenSize.height / 20,
                  ),
                  SizedBox(
                    height: screenSize.height / 5,
                    width: screenSize.width / 1.5,
                    child: Image.asset(imgPath),
                  ),
                  Container(
                    height: screenSize.height / 2,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 10,
                          blurRadius: 7,
                          offset: Offset(0, 50), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenSize.height / 20,
                        ),

                        SizedBox(
                          height: screenSize.height / 20,
                        ),
                        // Button(
                        //   width: Get.find<ViewController>().portrait.value?screenWidth:screenHeight,
                        //   height: Get.find<ViewController>().portrait.value?screenHeight:screenWidth,
                        //   text: "Sign In",
                        //   onPressed: () {},
                        // ),
                        SizedBox(
                          height: screenSize.height / 15,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forgot Your Password?",
                            style: TextStyle(
                                fontSize: screenSize.width / 30,
                                color: Colors.grey[400]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height / 40,
                  ),
                  Policy(),
                ],
              );
            },
          ),
          //   ),
          // ),
        );
      },
    );
  }
}
