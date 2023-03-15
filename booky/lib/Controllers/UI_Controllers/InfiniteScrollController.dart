import 'package:flutter/material.dart';

class InfiniteScrollController{

  static ScrollController scrollController = ScrollController();

  static void handleNext() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {

      }
    });
  }
}