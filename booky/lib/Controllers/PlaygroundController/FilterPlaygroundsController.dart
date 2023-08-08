import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:get/get.dart';

import '../../Models/PlaygroundModel.dart';
import '../../Remote_Services_APIs/PlaygroundRemoteServices/FilterPlaygroundsRemoteService.dart';
import '../../Remote_Services_APIs/PlaygroundRemoteServices/nearst_playgrounds.dart';
import '../GeoLocationControllers/GeoLocationAPIs.dart';
import '../UI_Controllers/AlertsAndLoadingControllers.dart';

///
/// this controller is used to call filter playground remote service
///
class FilterPlaygroundsController extends GetxController {
  var filterPlaygroundController = <PlaygroundResponse>[].obs;

  void setFilterPlaygroundController(
      List<PlaygroundResponse> filterPlaygrounds) {
    filterPlaygroundController.value = filterPlaygrounds;
    filterPlaygroundController.refresh();
  }

  RxList<PlaygroundResponse> getFilterPlaygroundController() {
    return filterPlaygroundController;
  }

  @override
  void onInit() async {
    await filterPlaygrounds(ownerUsername: 'admin');
    super.onInit();
  }

  /// we can filter playgrounds with multiple fields
  /// therefore this function can be used for different purposes such as filtering
  /// by city name, governorate name or search by open time and close time
  /// if we want to filter using only 1 field then just pass this field upon calling the func
  /// as the rest of the fields have empty default values
  Future<void> filterPlaygrounds(
      {pageNumber = 1,
      pageSize = 10,
      String cityName = '',
      String governorateName = '',
      String openTime = '',

      ///openTime and closeTime should follow hh:mm:ss format
      String closeTime = '',

      ///ex: '10:00:00','12:03:60',etc
      String pricePerHour = '',
      String ownerUsername = ''}) async {
    var a = Get.put(AlertsAndLoadingControllers());
    Get.find<AlertsAndLoadingControllers>().togglePlaygroundFilterLoading();
    var filterPlaygrounds =
        await FilterPlaygroundsRemoteService.filterPlaygrounds(
            pageNumber: pageNumber,
            pageSize: pageSize,
            cityName: cityName,
            governorateName: governorateName,
            openTime: openTime,
            closeTime: closeTime,
            pricePerHour: pricePerHour,
            ownerUsername: ownerUsername);
    Get.find<AlertsAndLoadingControllers>().togglePlaygroundFilterLoading();
    if (filterPlaygrounds != null) {
      setFilterPlaygroundController(filterPlaygrounds);
    }
  }
}
