import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:get/get.dart';

import '../../Models/PlaygroundModel.dart';
import '../../Remote_Services_APIs/PlaygroundRemoteServices/nearst_playgrounds.dart';
import '../GeoLocationControllers/GeoLocationAPIs.dart';
import '../UI_Controllers/AlertsAndLoadingControllers.dart';

class NearestPlaygroundsController extends GetxController {
  var nearestPlaygroundController = <PlaygroundResponse>[].obs;
  RxDouble distance = 5.0.obs;

  void setNearestPlaygroundController(
      List<PlaygroundResponse> nearestPlaygrounds) {
    nearestPlaygroundController.value = nearestPlaygrounds;
    nearestPlaygroundController.refresh();
  }

  RxList<PlaygroundResponse> getNearestPlaygroundController() {
    return nearestPlaygroundController;
  }

  void setDistance(double distanceParam){
    distance.value=distanceParam;
    distance.refresh();
  }

  double getDistance(){
    return distance.value;
  }

  @override
  void onInit() async {
    var a = Get.put(GeoLocationAPIs());
    var location=await Get.find<GeoLocationAPIs>().determinePosition();
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
    if (!Get.find<AlertsAndLoadingControllers>().getNearestPlaygroundLoading()) {
      Get.find<AlertsAndLoadingControllers>().toggleNearestPlaygroundLoading();
    }
    var nearestPlaygrounds =
        await NearestPlaygroundsRemoteService.fetchNearestPlaygrounds(
            pageNumber: pageNumber,
            pageSize: pageSize,
            location: location,
            distance: distance);
    Get.find<AlertsAndLoadingControllers>().toggleNearestPlaygroundLoading();
    if (nearestPlaygrounds != null) {
      setNearestPlaygroundController(nearestPlaygrounds);
    }
  }
}
