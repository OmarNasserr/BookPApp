import 'package:intl/intl.dart';

class TimeController{

  static String getTodayDate(){
    var now = DateTime.now();
    var formatter =  DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    print(formattedDate);
    return formattedDate;
  }
}