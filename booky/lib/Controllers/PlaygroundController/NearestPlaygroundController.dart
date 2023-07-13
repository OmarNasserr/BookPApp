import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:get/get.dart';

import '../../Models/PlaygroundModel.dart';
import '../../Remote_Services_APIs/PlaygroundRemoteServices/nearst_playgrounds.dart';
import '../GeoLocationControllers/GeoLocationAPIs.dart';
import '../UI_Controllers/AlertsAndLoadingControllers.dart';

class NearestPlaygroundsController extends GetxController {
  var nearestPlaygroundController = <PlaygroundResponse>[].obs;

  void setNearestPlaygroundController(
      List<PlaygroundResponse> nearestPlaygrounds) {
    nearestPlaygroundController.value = nearestPlaygrounds;
    nearestPlaygroundController.refresh();
  }

  RxList<PlaygroundResponse> getNearestPlaygroundController() {
    return nearestPlaygroundController;
  }

  @override
  void onInit() async {
    var a = Get.put(GeoLocationAPIs());
    var location=await Get.find<GeoLocationAPIs>().determinePosition();
    debugPrint(location.toString());
    var passedLocation="${location.latitude.toString()},${location.longitude.toString()}" ;
    await fetchPlaygrounds(location: passedLocation,distance: 18);
    super.onInit();
  }

  Future<void> fetchPlaygrounds(
      {pageNumber = 1,
      pageSize = 5,
      String location = '29,31',
      int distance = 5}) async {
    var a = Get.put(AlertsAndLoadingControllers());
    Get.find<AlertsAndLoadingControllers>().toggleNearestPlaygroundLoading();
    var nearestPlaygrounds =
        await NearestPlaygroundsRemoteService.fetchNearestPlaygrounds(
            pageNumber: pageNumber,
            pageSize: pageSize,
            location: location,
            distance: distance);
    Get.find<AlertsAndLoadingControllers>().toggleNearestPlaygroundLoading();
    print("NEAREST PA ${nearestPlaygrounds}");
    if (nearestPlaygrounds != null) {
      setNearestPlaygroundController(nearestPlaygrounds);
    }
  }
}
