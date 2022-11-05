// ignore_for_file: prefer_const_declarations, depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DataBaseHelper {
  // Final uma vez atribuido o valor não sofrerá alteração
  static final _databaseName = 'Terrenos.db';
  static final _databaseVersion = 1;

  static final table = 'cadTerrenos';

  static final columId = 'id';
  static final columRua = 'Rua';
  static final columBairro = 'Bairro';
  static final columValor = 'Valor';

  //singleton = clase tem apenas um referência
  DataBaseHelper._privateConstructor();
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  //Tem apenas uma referência do Banco, pois é SINGLE
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    //instancia o BANCO no primerio acesso
    _database = await _initDatabase();
    return _database!;
  }

  //abrir o BANCO e criá-lo caso não exista
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $table($columId INTEGER PRIMARY KEY,"
        "$columRua TEXT NOT NULL, $columBairro TEXT NOT NULL, $columValor FLOAT NOT NULL)");
  }

//Métodos Helper

//Inserir uma linha no BANCO
//Cada Map é um valor da coluna
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return db.insert(table, row);
  }

//Retorna uma lista de Maps
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return db.query(table);
  }

//Retorna a contagem das linhas
  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  //Alterar um registro que já foi inserida
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columId];
    return db.update(table, row, where: '$columId = ?', whereArgs: [id]);
  }

  //Deletar um registro que já foi inserido
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return db.delete(table, where: '$columId = ?', whereArgs: [id]);
  }
}
