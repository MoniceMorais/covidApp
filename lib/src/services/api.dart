import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:covid_app/src/models/get_date.dart';
import 'package:covid_app/src/models/status.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

// URL base
const baseUrl = 'https://api.covid19api.com/live/country';

// País a ser consultado
const country = 'brazil';

// TODO: colocar data de seis meses atras de acordo com atara atual do dispositivo
// Data de seis meses atras
const dateSixMonthsAgo = '2020-05-16T13:13:30Z';

const dateTwoWeeksAgo = '2020-11-02T13:13:30Z';

const baseUrlFirebase = 'https://covidapp-17a55-default-rtdb.firebaseio.com/';

class ApiService {

  static Future <List<Status>> getCasesFromSixMonthsAgo() async {
    var url =
    Uri.parse('$baseUrl/$country/status/confirmed/date/${getDateSixMonthsAgo()}');
    var response = await http.get(url);
    Iterable casesInTheLastSixMonths = json.decode(response.body);
    return casesInTheLastSixMonths
        .map((model) => Status.fromJson(model))
        .toList();
  }

  static Future <List<Status>> getCasesTwoWeeksAgo() async {
    var url =
    Uri.parse('$baseUrl/$country/status/confirmed/date/${getDateTwoWeeksAgo()}');
    var response = await http.get(url);
    Iterable casesInTheLastSixMonths = json.decode(response.body);
    return casesInTheLastSixMonths
        .map((model) => Status.fromJson(model))
        .toList();
  }



}
