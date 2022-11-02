import 'package:flutter/material.dart';

class sobre_nos extends StatefulWidget {
  const sobre_nos({Key? key}) : super(key: key);
  @override
  State<sobre_nos> createState() => _sobre_nosState();
}

class _sobre_nosState extends State<sobre_nos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Sobre Nós'),
      ),

      body: Center(
        child: Text('Teste'),
      ),
    );

  }
}