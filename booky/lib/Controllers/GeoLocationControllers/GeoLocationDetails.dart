import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GeoLocationDetails extends GetxController {
  late Position currentLocation;
  double distanceBet2Locations = 0.0.obs();
}
