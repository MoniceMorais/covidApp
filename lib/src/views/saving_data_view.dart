import 'package:flutter/material.dart';

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
        child: Center( child: const CircularProgressIndicator()),
      ),
    );
  }
}
