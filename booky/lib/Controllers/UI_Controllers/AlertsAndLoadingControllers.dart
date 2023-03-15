import 'package:get/get.dart';

class AlertsAndLoadingControllers extends GetxController{
  ///
  RxBool nearestPlaygroundsLoading=false.obs;
  void toggleNearestPlaygroundLoading(){
    nearestPlaygroundsLoading.value=!nearestPlaygroundsLoading.value;
  }
  bool getNearestPlaygroundLoading(){
    return nearestPlaygroundsLoading.value;
  }
  ///
  ///
  RxBool playgroundDetailsLoading=false.obs;
  void togglePlaygroundDetailsLoading(){
    playgroundDetailsLoading.value=!playgroundDetailsLoading.value;
  }
  bool getPlaygroundDetailsLoading(){
    return playgroundDetailsLoading.value;
  }
///
  ///
  RxBool availableHoursLoading=false.obs;
  void toggleAvailableHoursLoading(){
    availableHoursLoading.value=!availableHoursLoading.value;
  }
  bool getAvailableHoursLoading(){
    return availableHoursLoading.value;
  }
///
  ///
  RxBool citiesLoading=false.obs;
  void toggleCitiesLoading(){
    citiesLoading.value=!citiesLoading.value;
  }
  bool getCitiesLoading(){
    return citiesLoading.value;
  }
///
  ///
  RxBool playgroundFilterLoading=false.obs;
  void togglePlaygroundFilterLoading(){
    playgroundFilterLoading.value=!playgroundFilterLoading.value;
  }
  bool getPlaygroundFilterLoading(){
    return playgroundFilterLoading.value;
  }
///
}