import 'package:covid_app/src/views/cases_view.dart';
import 'package:covid_app/src/views/moving_average_view.dart';
import 'package:covid_app/src/views/saving_data_view.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                  'https://imagens.ebc.com.br/mdCT7D6BB_zwzST2OV9M2wylcWQ=/754x0/smart/https://agenciabrasil.ebc.com.br/sites/default/files/thumbnails/image/fundacao_oswaldo_cruz_fiocruz2905200386.jpg?itok=rIzCgt7_'),
            ),
            const Text(
              'Fundação Oswaldo Cruz (Fiocruz) - Erasmo Salomão/MS',
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                color: Theme.of(context).primaryColor,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CasesView(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Center(
                      child: Text(
                        'Casos',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                color: Theme.of(context).primaryColor,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MovingAverageView(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Center(
                      child: Text(
                        'Média móvel',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                color: Theme.of(context).primaryColor,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SavingDataView(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Center(
                      child: Text(
                        'Salvar dados',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
