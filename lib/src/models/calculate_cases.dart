import 'package:covid_app/src/models/status.dart';

int getCasesInLastSixMonths(List<Status> cases) {
  var casesFromSixMonthsAgo = cases.last.confirmed;
  var currentCases = cases.first.confirmed;

  return currentCases! - casesFromSixMonthsAgo!;
}

