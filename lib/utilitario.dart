import 'package:flutter/material.dart';

class utilitario extends StatefulWidget {
  const utilitario({Key? key}) : super(key: key);
  @override
  State<utilitario> createState() => _utilitarioState();
}

class _utilitarioState extends State<utilitario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Utilidade'),
      ),

      body: Center(
        child: Text('Teste'),
      ),
    );

  }
}