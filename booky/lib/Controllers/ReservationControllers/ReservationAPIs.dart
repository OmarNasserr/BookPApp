import 'package:get/get.dart';

import '../../Models/PlaygroundDetailsByID.dart';
import '../PlaygroundController/PlaygroundDetailsByIdController.dart';
import '../TimeControllers/TimeController.dart';
import '../UI_Controllers/AlertsAndLoadingControllers.dart';
import 'ReservationUI.dart';

class ReservationAPIs extends GetxController {
  ///
  RxList<String> availableReservationTimes = [''].obs;

  RxList<String> getAvailableReservationTimes() {
    return availableReservationTimes;
  }

  void setAvailableReservationTimes(List<String> availabelTimes) {
    availableReservationTimes.value = availabelTimes;
    availableReservationTimes.refresh();
  }

  ///this func is called when a playground is selected, it returns the details of the playground
  ///of TodayDate() by default
  Future<Rx<PlaygroundDetailsById>> onSelectingPlayground(String id)async{

    await Get.find<PlaygroundDetailsController>().fetchPlaygroundDetails(date: TimeController.getTodayDate(),
        id: id,overlayLoading: true);
    var playgroundDetail=Get.find<PlaygroundDetailsController>().getPlaygroundDetailsController();

    ///this func takes all the available hours and set the av reservation times UI controller
    Get.find<ReservationAPIs>()
        .setAvailableReservationTimes(playgroundDetail.value.hoursAvaialble);
    return playgroundDetail;
  }

  Future<void> onDateChange(DateTime date, String id) async {

    ///as reservations can only be done in a single day date, when date changes restart total
    ///amount to be paid to zero
    Get.find<ReservationUI>().restartTotalPayToZero();
    ///toggle av hours loading for UI to load
    Get.find<AlertsAndLoadingControllers>().toggleAvailableHoursLoading();
    ///as date is passed as date and hours and we only need date so split the str
    var passedDate = date.toString().split(" ");
    ///fetch playground details by id and date to return the playground details with
    ///the av hours to be booked in that exact date
    await Get.find<PlaygroundDetailsController>()
        .fetchPlaygroundDetails(date: passedDate.first.toString(), id: id,overlayLoading: false);
    var playgroundDetail = Get.find<PlaygroundDetailsController>()
        .getPlaygroundDetailsController();
    ///this func takes all the available hours and set the av reservation times UI controller
    Get.find<ReservationAPIs>()
        .setAvailableReservationTimes(playgroundDetail.value.hoursAvaialble);
    Get.find<AlertsAndLoadingControllers>().toggleAvailableHoursLoading();
  }
}
