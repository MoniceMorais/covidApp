import 'package:flutter/material.dart';

class MovingAverageView extends StatefulWidget {
  const MovingAverageView({Key? key}) : super(key: key);

  @override
  _MovingAverageViewState createState() => _MovingAverageViewState();
}

class _MovingAverageViewState extends State<MovingAverageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Média Móvel de Mortes'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return _buildMovingAverageDay(index, 'data', index);
        },
      ),
    );
  }

  Widget _buildMovingAverageDay(
      int movingAverageValue, String date, int somatoryOfDeaths) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topRight,
                child: Text(date),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text('Media móvel de mortes:'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  movingAverageValue.toString(),
                  style: const TextStyle(
                    fontSize: 32.0,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                    'Somatório de mortes nos últimos 7 dias: ${somatoryOfDeaths.toString()}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
