// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_1/sobre_nos.dart';
import 'package:flutter_application_1/utilitario.dart';
import 'sobre_nos.dart';
import 'cad_imoveis.dart';
import 'cad_terreno.dart';
import 'utilitario.dart';

class principal extends StatelessWidget {
  const principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
              SizedBox(
                height: 30,
                width: 150,
                  child :TextButton(
                    style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 15,
                    shadowColor: Colors.blue,
                  ),
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Cadastrar Imovel',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                    onPressed: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => cad_imoveis()));
                    },
                  )
              ),


              SizedBox(
                height: 30,
                width: 150,
                child: TextButton(
                  style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 15,
                  shadowColor: Colors.blue,
                ),
                // ignore: prefer_const_constructors
                child: Text(
                  'Cadastrar Terreno',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => cad_terreno()));
                  },
                ),
            ),


              SizedBox(
                height: 30,
                width: 150,
                child:TextButton(
                  style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 15,
                  shadowColor: Colors.blue,
                ),
                // ignore: prefer_const_constructors
                child: Text(
                  'Utilitário',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => utilitario()));
                  },
                ),
              ),


            SizedBox(
                height: 30,
                width: 150,
              child: TextButton(
                style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 15,
                shadowColor: Colors.blue,
              ),
              // ignore: prefer_const_constructors
              child: Text(
                'Sobre Nós',
                // ignore: prefer_const_constructors
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => sobre_nos()));
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}