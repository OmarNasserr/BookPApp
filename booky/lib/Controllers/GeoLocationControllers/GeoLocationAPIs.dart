import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

import 'GeoLocationDetails.dart';

class GeoLocationAPIs extends GetxController {
  ///
  var a = Get.put(GeoLocationDetails());
  GeoLocationDetails geoLocationDetails = Get.find<GeoLocationDetails>();

  ///
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    geoLocationDetails.currentLocation = await Geolocator.getCurrentPosition();
    debugPrint("Current Location ${geoLocationDetails.currentLocation}");
    return geoLocationDetails.currentLocation;
  }

  ///
  /// Geolocator.distanceBetween function returns the distance in meters and we require the distance
  /// to be in  KMs, therefore we divide the output by 1000
  ///
  double distanceBetween2Locations(
      double lat1, double long1, double lat2, double long2) {
    geoLocationDetails.distanceBet2Locations =
        Geolocator.distanceBetween(lat1, long1, lat2, long2) / 1000;
    debugPrint(
        "distance bet 2 locations ${geoLocationDetails.distanceBet2Locations}");
    return geoLocationDetails.distanceBet2Locations;
  }
}
