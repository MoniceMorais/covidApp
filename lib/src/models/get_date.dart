
String getDateSixMonthsAgo(){
  DateTime date = DateTime.now();
  DateTime dateOld = DateTime(date.year, date.month - 6, date.day);

  int day = dateOld.day;
  int month = dateOld.month;
  int year = dateOld.year;

  return "${year.toString()}-${month.toString()}-${day.toString()}T13:13:30Z";
}

String getDateTwoWeeksAgo(){
  DateTime date = DateTime.now();
  DateTime dateOld = DateTime(date.year, date.month, date.day - 15);

  int day = dateOld.day;
  int month = dateOld.month;
  int year = dateOld.year;

  return "${year.toString()}-${month.toString()}-${day.toString()}T13:13:30Z";
}