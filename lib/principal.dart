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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Botão que redireciona para a página SOBRE NÓS
              FlatButton(
                color: Colors.black,
                textColor: Colors.white,
                child: Text('Primeiro Crud'),
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => cad_imoveis()));
                },
            ),
            //BOTÃO QUE REDIRECIONA PRO PRIMEIRO CRUD
            FlatButton(
                color: Colors.black,
                textColor: Colors.white,
                child: Text('Segundo Crud'),
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => cad_terreno()));
                },
            ),
            //BOTÃO QUE REDIRECIONA PRO PRIMEIRO CRUD
            FlatButton(
                color: Colors.black,
                textColor: Colors.white,
                child: Text('Utilitário'),
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => utilitario()));
                },
            ),

            FlatButton(
                color: Colors.black,
                textColor: Colors.white,
                child: Text('Sobre Nós'),
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => sobre_nos()));
                },
            ),

          ],
        ),
      )
    );
  }
}