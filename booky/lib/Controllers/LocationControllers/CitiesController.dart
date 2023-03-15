import 'package:get/get.dart';

import '../../Models/LocationModels/CitiesModel.dart';
import '../../Remote_Services_APIs/LocationRemoteServices/CitiesRemoteServices.dart';
import '../UI_Controllers/AlertsAndLoadingControllers.dart';

class CitiesController extends GetxController {
  var citiesController = <CitiesResponse>[].obs;

  void setCitiesController(
      List<CitiesResponse> cities) {
    citiesController.value = cities;
    citiesController.refresh();
  }

  RxList<CitiesResponse> getCitiesController() {
    return citiesController;
  }

  @override
  void onInit() async {
    await fetchCities();
    super.onInit();
  }

  Future<void> fetchCities(
      {pageNumber = 1,
        pageSize = 5,}) async {
    var a = Get.put(AlertsAndLoadingControllers());
    Get.find<AlertsAndLoadingControllers>().toggleCitiesLoading();
    var cities =
    await CitiesRemoteService.fetchCities(
        pageNumber: pageNumber,
        pageSize: pageSize,);
    Get.find<AlertsAndLoadingControllers>().toggleCitiesLoading();
    if (cities != null) {
      setCitiesController(cities);
    }
  }
}
