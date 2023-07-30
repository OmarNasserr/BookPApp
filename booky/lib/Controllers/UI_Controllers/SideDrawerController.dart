import 'package:booky/Widgets/frquent_used_widgets/CustText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../../Widgets/HomePage/SideMenuTile.dart';
import '../ViewController/ViewController.dart';

class SideDrawerController {
  static List<String> tilesText = [
    'My Orders',
    'My Whishlist',
    'Notifications',
    'Contact us',
    'About us',
    'Country & Language',
    'Loyalty Program',
    'Blog',
    'Help & FAQs',
  ];

  static List<String> icons= [
    'Assets/Icons/drawerBag.svg',
    'Assets/Icons/heart.svg',
    'Assets/Icons/notification.svg',
    'Assets/Icons/message.svg',
    'Assets/Icons/about_us.svg',
    'Assets/Icons/global.svg',
    'Assets/Icons/gift.svg',
    'Assets/Icons/document-text.svg',
    'Assets/Icons/help.svg',
  ];

  static List<String> notifications=[
    '1',//my orders
    '2',//my wishlist
    '3',//Notifications
  ];

  static List<Widget> screens=[
    // ProfileScreen(),

  ];

  static List<Widget> sideMenuTiles(context){
        final Size size = MediaQuery.of(context).size;
    List<Widget> tiles=[];
    try {
      int len=icons.length<=10?icons.length:10;
      for(int i=0;i<icons.length;i++){
        tiles.add(SideMenuTile(
          size: size,
          viewController: Get.find<ViewController>(),
          iconData: icons[i],
          tileText: tilesText[i],
          notificationNo: i>=notifications.length?'':notifications[i],
          onPressed: (){
              Get.to(()=>screens[i]);
          },
        ));
      }
      return tiles;
    } on Exception catch (e) {
      tiles.add(
        CustText(text: "Something went wrong.", fontSize: size.width/15)
      );
      return tiles;
    }
  }

}
