import 'dart:convert';

import 'package:booky/Constant/serverURI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loader_overlay/loader_overlay.dart';

import '../../../Models/content_manag_sys/homepage/slider_images.dart';


class SliderImageRemoteService {
  static Future<dynamic> fetchSliderImagesService() async {
    try {
      var request = http.MultipartRequest(
          'GET',
          Uri.parse(
              '${ServerURI.uri}/api/v1/homepage/sliderimages/list/'));
      http.StreamedResponse streamedResponse = await request.send();
      var response1 = await http.Response.fromStream(streamedResponse);
      var response = utf8.decode(response1.bodyBytes);
      Map responseMap = json.decode(response);
      if (responseMap['status'] == 200) {
        var data = jsonEncode(responseMap);
        Get.context!.loaderOverlay.hide();
        return sliderImageFromJson(data).getImageUrls().map((url) => url.toString()).toList();
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
