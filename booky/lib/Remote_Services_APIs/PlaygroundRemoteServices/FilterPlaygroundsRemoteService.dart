import 'dart:convert';

import 'package:booky/Constant/serverURI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loader_overlay/loader_overlay.dart';

import '../../Models/PlaygroundModel.dart';

class FilterPlaygroundsRemoteService {

  static Future<dynamic> filterPlaygrounds({
    int pageNumber = 1,
    int pageSize = 10,
    String cityName='',
    String governorateName='',
    String openTime='',///openTime and closeTime should follow hh:mm:ss format
    String closeTime='',///ex: '10:00:00','12:03:60',etc
    String  pricePerHour='',
  }) async {
    try {
      var request = http.Request(
          'GET',
          Uri.parse(
              '${ServerURI.uri}/api/v1/playground/list/?page_number=$pageNumber&'
                  'page_size=$pageSize&city__city_name=$cityName&city__governorate=$governorateName&'
                  'open_time=$openTime&close_time=$closeTime&price_per_hour=$pricePerHour'));
      Get.context!.loaderOverlay.show();
      http.StreamedResponse streamedResponse = await request.send();
      var response1 = await http.Response.fromStream(streamedResponse);
      var response = utf8.decode(response1.bodyBytes);
      debugPrint("response $response");
      Map responseMap = json.decode(response);
      if (responseMap['status'] == 200) {
        var data = jsonEncode(responseMap['results']);
        Get.context!.loaderOverlay.hide();
        return playgroundResponseFromJson(data);
      }
    } on Exception catch (e) {
      debugPrint('FAILED 2 $e', wrapWidth: 1024);
      if (e.toString().contains('Failed host')) {
        Get.context!.loaderOverlay.hide();
        Get.defaultDialog(
            title: 'Check Internet', middleText: 'No Internet Connection');
      }
    }
  }
}
