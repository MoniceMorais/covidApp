import 'package:flutter/material.dart';

class DeathsView extends StatefulWidget {
  const DeathsView({Key? key}) : super(key: key);

  @override
  State<DeathsView> createState() => _DeathsViewState();
}

class _DeathsViewState extends State<DeathsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mortes por COVID19'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 64.0, bottom: 16.0),
                child: Text(
                  'Mortes por COVID19 no Brasil nos últimos seis meses',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ),
              Text(
                '1000',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
