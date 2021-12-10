import 'dart:convert';

import 'package:covid_app/src/models/calculate_cases.dart';
import 'package:covid_app/src/models/status.dart';
import 'package:covid_app/src/services/api.dart';
import 'package:flutter/material.dart';

class CasesView extends StatefulWidget {
  const CasesView({Key? key}) : super(key: key);

  @override
  State<CasesView> createState() => _CasesViewState();
}

class _CasesViewState extends State<CasesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Casos de COVID19'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75),
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Casos de COVID19 no Brasil nos últimos seis meses',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FutureBuilder<List<Status>>(
                      future: ApiService.getCases(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            break;
                          case ConnectionState.waiting:
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const <Widget>[
                                  CircularProgressIndicator(),
                                  Text('Loading')
                                ],
                              ),
                            );
                          case ConnectionState.active:
                            break;
                          case ConnectionState.done:
                            return Text(
                              getCasesInLastSixMonths(snapshot.data!).toString(),
                              style: const TextStyle(
                                fontSize: 64.0,
                                color: Colors.redAccent,
                              ),
                            );
                        }
                        return const Text('Unknown error');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
