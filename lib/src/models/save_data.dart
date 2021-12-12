import 'package:covid_app/src/models/status.dart';
import 'package:flutter/cupertino.dart';

int saveData(List<Status> cases, double lat, double long) {
  int province = 27;
  int days = 30;

//----------------------------------------------------------------------------//
  // Pega as mortes em todos os estados a cada dia e salva em totalDeathsInCountryPerDay
  List<int> totalDeathsInCountryPerDay = [];
  int totalDeathsDay = 1;

  for (var i = 1; i <= days; i++) {
    for (var j = 1; j <= province; j++) {
      var index = (((i * province) - province) + j);
      if (index < cases.length) {
        totalDeathsDay += cases[index].deaths!;
      } else {
        totalDeathsDay += cases[(cases.length - 1)].deaths!;
      }
    }
    totalDeathsInCountryPerDay.add(totalDeathsDay);
  }

  int indexMaxValueDeaths = 0;
  int maxValueDeaths = 0;

  for (var i = 0; i < (totalDeathsInCountryPerDay.length - 1); i++) {
    if (i == 0) {
      indexMaxValueDeaths = 0;
      maxValueDeaths = totalDeathsInCountryPerDay[i];
    }
    if (totalDeathsInCountryPerDay[i] > maxValueDeaths) {
      indexMaxValueDeaths = i;
      maxValueDeaths = totalDeathsInCountryPerDay[i];
    }
  }

  //-------------------------------------------------------------------//
  List<int> totalCasesInCountryPerDay = [];
  int totalCasesDay = 1;

  for (var i = 1; i <= days; i++) {
    for (var j = 1; j <= province; j++) {
      var index = (((i * province) - province) + j);
      if (index < cases.length) {
        totalCasesDay += cases[index].confirmed!;
      } else {
        totalCasesDay += cases[(cases.length - 1)].confirmed!;
      }
    }
    totalCasesInCountryPerDay.add(totalCasesDay);
  }

  int indexMaxValueCases = 0;
  int maxValueCases = 0;

  for (var i = 0; i < (totalCasesInCountryPerDay.length - 1); i++) {
    if (i == 0) {
      indexMaxValueCases = 0;
      maxValueCases = totalCasesInCountryPerDay[i];
    }
    if (totalCasesInCountryPerDay[i] > maxValueCases) {
      indexMaxValueCases = i;
      maxValueCases = totalCasesInCountryPerDay[i];
    }
  }

  //-------------------------------------------------------------------//

  List<String> dates = [];
  String dateMaxCases = "";
  String dateMaxDeaths = "";

  // Pega as datas de cases
  for (var j = 0; j < cases.length; j++) {
    if ((j % 27) == 0) {
      dates.add(cases[j].date!);
    }
  }

  if (indexMaxValueCases >= dates.length) {
    dateMaxCases = dates[dates.length - 1];
  } else {
    dateMaxCases = dates[indexMaxValueCases];
  }

  if (indexMaxValueDeaths >= dates.length) {
    dateMaxDeaths = dates[dates.length - 1];
  } else {
    dateMaxDeaths = dates[indexMaxValueDeaths];
  }

  //-----------------------------------------------------------------//



  return 1;
}
