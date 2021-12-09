import 'package:covid_app/src/views/dashboard_view.dart';
import 'package:covid_app/src/views/deaths_view.dart';
import 'package:covid_app/src/views/moving_average_view.dart';
import 'package:covid_app/src/views/saving_data_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CovidApp());
}

class CovidApp extends StatelessWidget {
  const CovidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        //colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.teal.shade900),
      ),
      home: const Dashboard(),
    );
  }
}
