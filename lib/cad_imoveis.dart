import 'package:flutter/material.dart';

class cad_imoveis extends StatefulWidget {
  const cad_imoveis({Key? key}) : super(key: key);
  @override
  State<cad_imoveis> createState() => _cad_imoveisState();
}

class _cad_imoveisState extends State<cad_imoveis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Cadastro de Imóveis'),
      ),

      body: Center(
        child: Text('Teste'),
      ),
    );

  }
}