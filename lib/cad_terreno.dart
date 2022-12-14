// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, avoid_function_literals_in_foreach_calls, avoid_print, use_key_in_widget_constructors, sort_child_properties_last, duplicate_ignore, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/DatabaseHelperTerreno.dart';
import 'principal.dart';

void main() => runApp(cad_terreno());

class cad_terreno extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Terrenos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: MyHomeTerreno(),
    );
  }
}

class MyHomeTerreno extends StatelessWidget {
  // Referencia nossa classe single para gerencia o BANCO
  final dbHelper = DataBaseHelper.instance;

  // layout da homepage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Cadastro de Terrenos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              height: 30,
              width: 200,

            child : ElevatedButton(
                  child: Text(
                  'Inserir dados',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _inserir();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black)),
            ),
            

            SizedBox(
              height: 30,
              width: 200,
            child :ElevatedButton(
                // ignore: sort_child_properties_last
                child: Text(
                  'Consultar dados',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _consultar();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black)),
            ),
            SizedBox(
              height: 30,
              width: 200,
                child: ElevatedButton(
                child: Text(
                  'Atualizar dados',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _atualizar();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black)),
            ),


            SizedBox(
              height: 30,
              width: 200,
            child: ElevatedButton(
                child: Text(
                  'Deletar dados',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _deletar();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black)),
            ),

            SizedBox(
            child: ElevatedButton(
                child: Text(
                  'Voltar',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                  builder: (_) => principal()
        ));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  // Button onPressed methods

  //M??todo para inserir dados
  void _inserir() async {
    //linha para ser inserida
    Map<String, dynamic> row = {
      DataBaseHelper.columRua: 'Rua Carlos Diesgois',
      DataBaseHelper.columBairro: 'S??o Cristovao',
      DataBaseHelper.columValor: '300.000',
    };
    final id = await dbHelper.insert(row);
    print('Linha inserida id: $id');
  }

  //M??todo para consultar dados
  void _consultar() async {
    final todasLinhas = await dbHelper.queryAllRows();
    print('Consulta todas as linhas');
    todasLinhas.forEach((row) => print(row));
  }

  //M??todo para atualizar dados
  void _atualizar() async {
    // linha para atualizar
    Map<String, dynamic> row = {
      DataBaseHelper.columId: 1,
      DataBaseHelper.columRua: 'Rua Tomcobi',
      DataBaseHelper.columBairro: 'Vale Verde',
      DataBaseHelper.columValor: '300.000',
    };
    final linhasAfetadas = await dbHelper.update(row);
    print('Atualizadas $linhasAfetadas linha(s)');
  }

  //M??todo para deletar dados
  void _deletar() async {
    // Assumindo que o numero de linhas ?? o id para a ??ltima linha
    final id = await dbHelper.queryRowCount();
    final linhaDeletada = await dbHelper.delete(id!);
    print('Deletada(s) $linhaDeletada linha(s): linha $id');
  }
}
