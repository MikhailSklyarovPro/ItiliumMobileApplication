class Global{
  static late List<Map> orders;
  static late List<Map> requests;
  static late List<Map> approvals;
  static late List<Map> files;

  static String convertDate(DateTime date){
    int day = date.day;
    int month = date.month;
    int year = date.year;
    String newDate ="";
    if(day<10){
      newDate = "0$day.";
    }else
    {
      newDate = "$day";
    }
    if(month<10){
      newDate = "${newDate}0$month.";
    }
    else{
      newDate = "$newDate$month.";
    }
    newDate = "$newDate$year";
    return newDate;
  }

  static String convertTime(DateTime date){
    int hour = date.hour;
    int minute = date.minute;
    int second = date.second;
    String newDate ="${convertDate(date)} ";
    newDate = hour < 10 ? "${newDate}0$hour:" : "$newDate$hour:";
    newDate = minute < 10 ? "${newDate}0$minute:" : "$newDate$minute:";
    newDate = second < 10 ? "${newDate}0$second" : "$newDate$second";
    return newDate;
  }
}