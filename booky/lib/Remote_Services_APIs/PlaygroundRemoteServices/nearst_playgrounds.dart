import 'dart:convert';

import 'package:booky/Constant/serverURI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loader_overlay/loader_overlay.dart';

import '../../Models/PlaygroundModel.dart';


class NearestPlaygroundsRemoteService {
  static Future<dynamic> fetchNearestPlaygrounds(
      {int pageNumber = 1,
      int pageSize = 10,
      String location = '29.968265972081504,31.314083507416978',
      int distance = 5}) async {
    try {
      var request = http.MultipartRequest(
          'GET',
          Uri.parse(
              '${ServerURI.uri}/api/v1/playground/list/nearest_playgrounds/?page_number=$pageNumber&page_size=$pageSize'));
      request.fields.addAll({
        'location': location,
        'distance': distance.toString(),
      });
      http.StreamedResponse streamedResponse = await request.send();
      var response1 = await http.Response.fromStream(streamedResponse);
      var response = utf8.decode(response1.bodyBytes);
      Map responseMap = json.decode(response);
      if (responseMap['status'] == 200) {
        var data = jsonEncode(responseMap['results']);
        return playgroundResponseFromJson(data);
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
