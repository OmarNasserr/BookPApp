// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
//
//
// class TimeController{
//   static TimeOfDay now = TimeOfDay.now();
//
//   static String timeOfDay(){
//
//     if(now.hour<12){
//       return 'Good Morning';
//     }
//     else if(now.hour<18){
//       return 'Good Afternoon';
//     }
//     else{
//       return 'Good Evening';
//     }
//   }
//
//   static showBirthDateSheet(BuildContext context,double screenWidth){
//     return DatePicker.showDatePicker(context,
//         showTitleActions: true,
//         minTime: DateTime(1950),
//         maxTime: DateTime(DateTime.now().year - 8, 12, 31),
//         theme: DatePickerTheme(
//             cancelStyle: TextStyle(color: Color(0xFF424141)),
//             headerColor: Color(0xFF8CA29B),
//             backgroundColor: Color(0xFF8CA29B),
//             itemStyle: TextStyle(
//                 color: Color(0xFFFffdfc),
//                 fontWeight: FontWeight.bold,
//                 fontSize: screenWidth / 20),
//             doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
//         onChanged: (date) {}, onConfirm: (date) {
//           print('confirm $date');
//         }, currentTime: DateTime.now(), locale: LocaleType.en);
//   }
// }