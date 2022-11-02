// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, avoid_function_literals_in_foreach_calls, avoid_print, use_key_in_widget_constructors, sort_child_properties_last, duplicate_ignore, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/DatabaseHelper.dart';

class cad_imoveis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFlite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyCrudImoveis(),
    );
  }
}

class MyCrudImoveis extends StatelessWidget {
  // Referencia nossa classe single para gerencia o BANCO
  final dbHelper = DataBaseHelper.instance;

  // layout da homepage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD SQFlite'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                child: Text(
                  'Inserir dados',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _inserir();
                },
                style: TextButton.styleFrom(backgroundColor: Colors.blue)),
            SizedBox(height: 10.0),
            TextButton(
                // ignore: sort_child_properties_last
                child: Text(
                  'Consultar dados',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _consultar();
                },
                style: TextButton.styleFrom(backgroundColor: Colors.blue)),
            SizedBox(height: 10.0),
            TextButton(
                child: Text(
                  'Atualizar dados',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _atualizar();
                },
                style: TextButton.styleFrom(backgroundColor: Colors.blue)),
            SizedBox(height: 10.0),
            TextButton(
                child: Text(
                  'Deletar dados',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _deletar();
                },
                style: TextButton.styleFrom(backgroundColor: Colors.blue)),
          ],
        ),
      ),
    );
  }

  // Button onPressed methods

  //Método para inserir dados
  void _inserir() async {
    //linha para ser inserida
    Map<String, dynamic> row = {
      DataBaseHelper.columNome: 'Jhonata',
      DataBaseHelper.columIdade: 20,
      DataBaseHelper.columProfissao: 'TI Infraestrutura',
    };
    final id = await dbHelper.insert(row);
    print('Linha inserida id: $id');
  }

  //Método para consultar dados
  void _consultar() async {
    final todasLinhas = await dbHelper.queryAllRows();
    print('Consulta todas as linhas');
    todasLinhas.forEach((row) => print(row));
  }

  //Método para atualizar dados
  void _atualizar() async {
    // linha para atualizar
    Map<String, dynamic> row = {
      DataBaseHelper.columId: 1,
      DataBaseHelper.columNome: 'Claudio',
      DataBaseHelper.columIdade: 50,
      DataBaseHelper.columProfissao: 'Contabilidade',
    };
    final linhasAfetadas = await dbHelper.update(row);
    print('Atualizadas $linhasAfetadas linha(s)');
  }

  //Método para deletar dados
  void _deletar() async {
    // Assumindo que o numero de linhas é o id para a última linha
    final id = await dbHelper.queryRowCount();
    final linhaDeletada = await dbHelper.delete(id!);
    print('Deletada(s) $linhaDeletada linha(s): linha $id');
  }
}
