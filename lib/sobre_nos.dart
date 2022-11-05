import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class  sobre_nos extends StatelessWidget {
  const sobre_nos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre Nós'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('Sobre Nós'),
      )
    );
  }
}