import 'dart:convert';

import 'package:booky/Constant/serverURI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Models/LocationModels/CitiesModel.dart';


class CitiesRemoteService {

  static Future<dynamic> fetchCities(
      {int pageNumber = 1,
        int pageSize = 5,}) async {
    try {
      var request = http.MultipartRequest(
          'GET',
          Uri.parse(
              '${ServerURI.uri}/api/v1/location/cities/list/?page_number=$pageNumber&page_size=$pageSize'));

      http.StreamedResponse streamedResponse = await request.send();
      var response1 = await http.Response.fromStream(streamedResponse);
      var response= utf8.decode(response1.bodyBytes);
      debugPrint("response $response");
      Map responseMap=json.decode(response);
      if (responseMap['status'] == 200) {
        var data = jsonEncode(responseMap['results']);
        return citiesResponseFromJson(data);
      }
    } on Exception catch (e) {
      debugPrint('FAILED 2 $e', wrapWidth: 1024);
      if (e.toString().contains('Failed host')) {
        Get.defaultDialog(
            title: 'Check Internet', middleText: 'No Internet Connection');
      }
    }
  }
}