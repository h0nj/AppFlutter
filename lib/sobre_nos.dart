import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class sobre_nos extends StatefulWidget {
  const sobre_nos({Key? key}) : super(key: key);
  @override
  State<sobre_nos> createState() => MyHomeSobreNos();
}

class MyHomeSobreNos extends State<sobre_nos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Sobre Nós'),
      ),
      body: buildListView(),
    );
  }
  buildListView(){
    return ListView(
      children: [
        ListTile(
          title: Text("Jhonata de Souza Silva"),
        ),
        ListTile(
          title: Text("Objetivo:"),
          subtitle: Text('O aplicativo foi criado com o intuito de agilizar as pessoas a encontrarem '
          'sua nova residência de maneira mais prática.'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("Contato:"),
          subtitle: Text("jhonatazadesouza@hotmail.com \n"
          '32 99802-6486'),
        ),
      ],
    );
  }
}