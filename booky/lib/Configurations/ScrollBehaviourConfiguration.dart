import 'package:flutter/material.dart';


///this configuration is used to control the over scroll behavior
///as this eliminate the glow of listviews on over scrolling
class ScrollBehaviourConfiguration extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}