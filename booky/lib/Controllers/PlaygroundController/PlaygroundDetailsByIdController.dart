import 'package:booky/Controllers/TimeControllers/TimeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Models/PlaygroundDetailsByID.dart';
import '../../Remote_Services_APIs/PlaygroundRemoteServices/PlaygroundDetailsRemoteService.dart';
import '../UI_Controllers/AlertsAndLoadingControllers.dart';

class PlaygroundDetailsController extends GetxController {
  Rx<PlaygroundDetailsById> playgroundDetailsController = PlaygroundDetailsById(
      id: 'id',
      governorate: 'governorate',
      pName: 'pName',
      openTime: 'openTime',
      closeTime: 'closeTime',
      totalAvailableTime: 'totalAvailableTime',
      description: 'description',
      pricePerHour: 0,
      city: 'city',
      playgroundOwner: 'playgroundOwner',
      images: [],
      hoursAvaialble: []).obs;

  void setPlaygroundDetailsController(PlaygroundDetailsById playgroundDetails) {
    playgroundDetailsController.value = playgroundDetails;
    playgroundDetailsController.refresh();
  }

  Rx<PlaygroundDetailsById> getPlaygroundDetailsController() {
    return playgroundDetailsController;
  }

  // @override
  // void onInit() async {
  //   await fetchPlaygroundDetail(date:  TimeController.getTodayDate());
  //   super.onInit();
  // }

  Future<void> fetchPlaygroundDetails(
      {required String date, required String id,required bool overlayLoading}) async {
    var a = Get.put(AlertsAndLoadingControllers());
    Get.find<AlertsAndLoadingControllers>().togglePlaygroundDetailsLoading();
    var playgroundDetails =
        await PlaygroundDetailsByIdRemoteService.fetchPlaygroundDetailsByID(
            date: date, id: id,overlayLoading: overlayLoading);
    Get.find<AlertsAndLoadingControllers>().togglePlaygroundDetailsLoading();
    if (playgroundDetails != null) {
      setPlaygroundDetailsController(playgroundDetails);
    }else{
      debugPrint("FETCH PLAYGROUND DETAILS BY ID RETURNED A NULL VALUE");
    }
  }
}
