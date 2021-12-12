import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_app/src/models/save_data.dart';
import 'package:covid_app/src/models/status.dart';
import 'package:covid_app/src/services/api.dart';
import 'package:covid_app/src/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavingDataView extends StatefulWidget {
  const SavingDataView({Key? key}) : super(key: key);

  @override
  _SavingDataViewState createState() => _SavingDataViewState();
}

class _SavingDataViewState extends State<SavingDataView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salvar dados'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<List<Status>>(
            future: ApiService.getCasesOneMonthAgoAgo(),
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
                  return ChangeNotifierProvider<PostosController>(
                    create: (context) => PostosController(),
                    child: Builder(builder: (context) {
                      final local = context.watch<PostosController>();
                      String message = local.erro;
                      if(message == ''){
                        if(local.lat != 0 && local.long != 0){
                          saveData(snapshot.data!, local.lat, local.long);
                          message = "Dados salvos com sucesso!";
                        }
                      }
                      return Center(
                        child: Text(message),
                      );
                    }),
                  );
              }
              return const Text('Unknown error');
            },
          ),
        ),
      ),
    );
  }
}
