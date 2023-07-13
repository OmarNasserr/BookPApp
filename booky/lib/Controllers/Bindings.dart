
import 'package:booky/Controllers/ConentManagSysControllers/homepageControllers/SliderImageController.dart';
import 'package:get/get.dart';

import 'GeoLocationControllers/GeoLocationAPIs.dart';
import 'GeoLocationControllers/GeoLocationDetails.dart';
import 'PlaygroundController/FilterPlaygroundsController.dart';
import 'PlaygroundController/PlaygroundDetailsByIdController.dart';
import 'ReservationControllers/ReservationAPIs.dart';
import 'ReservationControllers/ReservationUI.dart';
import 'UI_Controllers/AlertsAndLoadingControllers.dart';
import 'ViewController/ViewController.dart';


class AllControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewController>(() => ViewController(), fenix: true);
    Get.lazyPut<ReservationUI>(() => ReservationUI(), fenix: true);
    Get.lazyPut<ReservationAPIs>(() => ReservationAPIs(), fenix: true);
    Get.lazyPut<GeoLocationAPIs>(() => GeoLocationAPIs(), fenix: true);
    Get.lazyPut<GeoLocationDetails>(() => GeoLocationDetails(), fenix: true);
    Get.lazyPut<AlertsAndLoadingControllers>(() => AlertsAndLoadingControllers(), fenix: true);
    Get.lazyPut<PlaygroundDetailsController>(() => PlaygroundDetailsController(), fenix: true);
    Get.lazyPut<FilterPlaygroundsController>(() => FilterPlaygroundsController(), fenix: true);
    Get.lazyPut<SliderImageController>(() => SliderImageController(), fenix: true);
  }
}



