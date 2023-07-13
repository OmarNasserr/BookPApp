import 'dart:developer';

import 'package:booky/Constant/serverURI.dart';
import 'package:booky/Controllers/ViewController/ViewController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../Models/LocationModels/CitiesModel.dart';
import '../../Models/PlaygroundModel.dart';
import '../../Widgets/HomePage/PlaygroundCard.dart';

class CardUIBuilderController {
  ///this function receives list of PlaygroundResponse Class and returns List<Widget>
  ///of PlaygroundCard
  static List<Widget> getPlaygrounds(RxList<PlaygroundResponse> nPlaygrounds,
      double screenHeight, double screenWidth,{bool showAll=false}) {
    List<Widget> playgrounds = [];
    int loopCounter=0;
    if (nPlaygrounds.length>=4){
      loopCounter=4;
    }else{
      loopCounter=nPlaygrounds.length;
    }
    for (int i = 0; i < loopCounter; i++) {
      if (!showAll && nPlaygrounds.length < i+1) {
        break;
      } else {
        playgrounds.add(PlaygroundCard(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          pName: nPlaygrounds[i].pName,
          imgThumbnail: nPlaygrounds[i].images.isEmpty?'${ServerURI.uri}/media/static/errPlayground.jpg':nPlaygrounds[i].images[0].image.toString(),
          hourRate: nPlaygrounds[i].pricePerHour,
          id: nPlaygrounds[i].id,
        ));
      }
    }
    return playgrounds;
  }

  ///this function receives list of CitiesResponse Class and returns List<Widget>
  ///of PlaygroundCard but with city properties
  static List<Widget> getTowns(RxList<CitiesResponse> cityResponse,
      double screenHeight, double screenWidth) {
    List<Widget> playgrounds = [];
    for (CitiesResponse city in cityResponse) {
      playgrounds.add(PlaygroundCard(
          city: true,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          pName: city.cityName,
          imgThumbnail: '',
          hourRate: 0,
          id: city.id));
    }
    return playgrounds;
  }

  ///this function receives List<Widget> and rearrange the widgets so every two widgets
  ///are in a row
  static List<Widget> setPlaygroundsRows(List<Widget> pGroundCards,
      ViewController viewController, double screenHeight, double screenWidth) {
    List<Widget> pRows = [];
    List<Widget> pgTemp = [];
    int count = 0;
    for (int i = 0; i < pGroundCards.length; i++) {
      count++;
      pgTemp.add(pGroundCards[i]);
      if (count % viewController.getPortrait(2, 4) == 0) {
        pRows.add(
          Container(
            height: viewController.getPortrait(
                screenHeight / 3.5, screenHeight / 3.5),
            child: Row(
              children: pgTemp,
            ),
          ),
        );
        pgTemp = [];
      } else if (pgTemp.isNotEmpty && count == pGroundCards.length) {
        pRows.add(
          Container(
            height: viewController.getPortrait(
                screenHeight / 3.5, screenHeight / 3.5),
            child: Center(
              child: Row(
                children: pgTemp,
              ),
            ),
          ),
        );
      }
    }
    return pRows;
  }
}
