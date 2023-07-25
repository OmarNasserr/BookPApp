import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:get/get.dart';

import '../../../Models/content_manag_sys/homepage/slider_images.dart';
import '../../../Remote_Services_APIs/ContentManagSysServices/homepage/SliderImagesService.dart';
import '../../UI_Controllers/AlertsAndLoadingControllers.dart';

class SliderImageController extends GetxController {
  var sliderImagesController = <String>[].obs;

  void setSliderImagesController(List<String> sliderImages) {
    sliderImagesController.value = sliderImages;
    sliderImagesController.refresh();
  }

  RxList<String> getSliderImagesController() {
    return sliderImagesController;
  }

  @override
  void onInit() async {
    await fetchSliderImages();
    super.onInit();
  }

  Future<void> fetchSliderImages({pageNumber = 1, pageSize = 3}) async {
    try {
      var a = Get.put(AlertsAndLoadingControllers());
      Get.find<AlertsAndLoadingControllers>().toggleNearestPlaygroundLoading();
      var sliderImages = await SliderImageRemoteService.fetchSliderImagesService();
      Get.find<AlertsAndLoadingControllers>().toggleNearestPlaygroundLoading();
      if (sliderImages != null) {
        setSliderImagesController(sliderImages);
      }
      else{
        log("SLIDER $sliderImages");
      }
    } on Exception catch (e) {
      debugPrint("Err $e");
    }
  }
}
