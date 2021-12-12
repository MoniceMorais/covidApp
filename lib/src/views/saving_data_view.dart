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
  CollectionReference _productss =
      FirebaseFirestore.instance.collection('data');

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  Future<void> _createOrUpdate() async {
    await _productss.add({"name": "teste", "price": "teste"});
  }




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
                  //var status = saveData(snapshot.data!);

                  return ChangeNotifierProvider<PostosController>(
                    create: (context) => PostosController(),
                    child: Builder(builder: (context) {
                      final local = context.watch<PostosController>();
                      _createOrUpdate();
                      var status =
                          saveData(snapshot.data!, local.lat, local.long);
                      String menssage = local.erro == ''
                          ? 'latitude: ${local.lat}'
                          : local.erro;

                      return Center(
                        child: Text(menssage),
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
