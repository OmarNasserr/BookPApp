import 'package:booky/Constant/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'Configurations/ScrollBehaviourConfiguration.dart';
import 'Controllers/Bindings.dart';
import 'Screens/HomePage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'Screens/firstPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: GetMaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: background,
            textSelectionTheme: const TextSelectionThemeData(
              selectionColor: Colors.green,
              cursorColor: Colors.green,
              selectionHandleColor: Colors.green,
            ),
            colorScheme: //color of glowing listView limit
                ColorScheme.fromSwatch().copyWith(secondary: Colors.green)),
        debugShowCheckedModeBanner: false,
        initialBinding: AllControllerBindings(),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: ScrollBehaviourConfiguration(),
            child: child!,
          );
        },
        home: FirstPage(),
      ),
      useDefaultLoading: false,
      overlayWidget: const Center(
        child: SpinKitFadingCube(
          color: Colors.green,
          size: 50.0,
        ),
      ),
      overlayColor: Colors.black,
      overlayOpacity: 0.9,
      duration: Duration(milliseconds: 500),
    );
  }
}
