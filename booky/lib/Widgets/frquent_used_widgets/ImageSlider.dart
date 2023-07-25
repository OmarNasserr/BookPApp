import 'dart:developer';
import 'dart:ui';

import 'package:booky/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../Models/content_manag_sys/homepage/slider_images.dart';
import 'CustText.dart';
import 'ImgFromUrlWithShimmer.dart';

class ImageSlider extends StatelessWidget {
  ImageSlider(
      {Key? key,
      required this.screenHeight,
      required this.images,
      required this.screenWidth});

  final double screenHeight;
  final double screenWidth;

  final List<String> images;

  List<Widget> slider = [];

  List<Widget> fillSlider() {
    print("IMG LEN ${images.length}");
    for (int i = 0; i < images.length; i++) {
      Widget image;
      image = FittedBox(
        child: ImgFromNetwork(imgUrl: images[i], boxFit: BoxFit.fill,),
        fit: BoxFit.fill,
      );
      slider.add(image);
    }
    return slider;
  }

  @override
  Widget build(BuildContext context) {
    return images.isNotEmpty?SizedBox(
      height: screenHeight / 4,
      width: screenWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(screenWidth / 10),
            bottomLeft: Radius.circular(screenWidth / 10)),
        child: ImageSlideshow(
          isLoop: true,
          autoPlayInterval: 5000,
          indicatorColor: secondaryColor,
          children: fillSlider(),
        )
            // :Center(child: CustText(text: 'يرجى التحقق من الاتصال', fontSize: screenWidth/15,)),
      ),
    ):Container();
  }
}
