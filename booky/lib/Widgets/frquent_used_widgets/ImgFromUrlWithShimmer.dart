import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImgFromNetwork extends StatelessWidget {
  final String imgUrl;
  final BoxFit boxFit;

  ImgFromNetwork({required this.imgUrl, required this.boxFit});
  @override
  Widget build(BuildContext context) {
    return FancyShimmerImage(
      imageUrl: imgUrl,
      boxFit: boxFit,
    );
  }
}
