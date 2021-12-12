import 'dart:core';
import 'package:covid_app/src/models/status.dart';

int getCasesInLastSixMonths(List<Status> cases) {
  int casesFromSixMonthsAgo = 1;
  int province = 28;
  for (var index = 1; index < province; index++) {
    casesFromSixMonthsAgo += cases[index].confirmed!;
  }

  int currentCases = 1;
  for (var index = (cases.length - 1); index > (cases.length - 28); index--) {
    currentCases += cases[index].confirmed!;
  }

  return currentCases - casesFromSixMonthsAgo;
}

List<int> getMovingAverage(List<int> sumOfDeaths) {
  List<int> total = [];

  for (var i = 0; i <= 13; i++) {
    total.add(sumOfDeaths[i] ~/ 7);
  }

  return total;
}

List<int> getMovingAverageSum(List<Status> cases) {
  List<int> sumOfDeaths = [];
  List<int> totalCountryPerDay = [];
  int totalCasesDay = 1;
  int province = 27;
  int days = 21;

  // Pega as mortes em todos os estados a cada dia e salva em totalCountryPerDay
  for (var i = 1; i <= days; i++) {
    for (var j = 1; j <= province; j++) {
      var index = (((i * province) - province) + j);
      if (index < cases.length) {
        totalCasesDay += cases[index].deaths!;
      } else {
        totalCasesDay += cases[(cases.length - 1)].deaths!;
      }
    }
    totalCountryPerDay.add(totalCasesDay);
  }

  for (var i = 0; i <= 14; i++) {
    sumOfDeaths.add(totalCountryPerDay[(i + 6)] - totalCountryPerDay[(i)]);
  }

  return sumOfDeaths;
}

List<String> getMovingAverageDates(List<Status> cases) {
  List<String> dates = [];

  // Pega as datas de cases
  for (var j = 1; j < cases.length; j++) {
    if ((j % 27) == 0) {
      dates.add(cases[j].date!);
    }
  }

  return dates;
}
