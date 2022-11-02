import 'package:flutter/material.dart';

class cad_terreno extends StatefulWidget {
  const cad_terreno({Key? key}) : super(key: key);
  @override
  State<cad_terreno> createState() => _cad_terrenoState();
}

class _cad_terrenoState extends State<cad_terreno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Cadastro de Terrenos'),
      ),

      body: Center(
        child: Text('Teste'),
      ),
    );

  }
}