import 'package:covid_app/src/screens/dashboard.dart';
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
      home: Dashboard(),
    );
  }
}
