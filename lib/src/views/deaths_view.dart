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
                children: const [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Mortes por COVID19 no Brasil nos últimos seis meses',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Text(
                    '1000',
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.redAccent,
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
