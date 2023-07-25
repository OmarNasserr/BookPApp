import 'dart:developer';
import 'dart:ui';

import 'package:booky/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../Models/content_manag_sys/homepage/slider_images.dart';
import 'CustText.dart';
import 'ImgFromUrlWithShimmer.dart';

class ImageSlider extends StatefulWidget {
  ImageSlider(
      {Key? key,
      required this.screenHeight,
      required this.images,
      required this.screenWidth});

  final double screenHeight;
  final double screenWidth;

  final List<String> images;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  List<Widget> slider = [];

  List<Widget> fillSlider() {
    for (int i = 0; i < widget.images.length; i++) {
      Widget image;
      image = FittedBox(
        child: ImgFromNetwork(imgUrl: widget.images[i], boxFit: BoxFit.fill,),
        fit: BoxFit.fill,
      );
      slider.add(image);
    }
    return slider;
  }

  @override
  void initState() {
    super.initState();
    /// I call this function in the initState to optimize performance, as I declared children of the slider with
    /// fillSlider() directly the function will be called in each build, but this way the function will be only called once
    /// and its value will be saved in the slider list for the future build.
    fillSlider();
  }

  @override
  Widget build(BuildContext context) {
    return widget.images.isNotEmpty?SizedBox(
      height: widget.screenHeight / 4,
      width: widget.screenWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(widget.screenWidth / 10),
            bottomLeft: Radius.circular(widget.screenWidth / 10)),
        child: ImageSlideshow(
          isLoop: true,
          autoPlayInterval: 5000,
          indicatorColor: secondaryColor,
          children: slider,
        )
            // :Center(child: CustText(text: 'يرجى التحقق من الاتصال', fontSize: screenWidth/15,)),
      ),
    ):Container();
  }
}
