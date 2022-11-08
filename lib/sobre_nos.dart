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
        title: Text('Sobre o Autor'),
      ),
      body: buildListView(),
    );
  }
  buildListView(){
    return ListView(
      children: [
        Icon(Icons.house_rounded, size: 120.0, color: Colors.black),
        ListTile(
          leading: Icon(Icons.notifications_rounded ),
          title: Text("Objetivo:"),
          subtitle: Text('O aplicativo foi criado com o intuito de agilizar as pessoas a encontrarem '
          'sua nova residência de maneira mais prática.'),
        ),
        ListTile(
          leading: Icon(Icons.mark_email_unread_rounded),
          title: Text("E-mail:"),
          subtitle: Text("jhonatazadesouza@hotmail.com \n"
          ),
        ),
        ListTile(
          leading: Icon(Icons.contact_phone_rounded),
          title: Text("Telefone:"),
          subtitle: Text("(32)99802-6486"
          ),
          
        ),
        ListTile(
          leading: Icon(Icons.dataset_linked_rounded),
          title: Text("Rede para contato:"),
          subtitle: Text("https://www.linkedin.com/in/jhonata-souza1812/"
          ),
        ),
        ListTile(
          leading: Icon(Icons.computer_rounded),
          title: Text("GitHub:"),
          subtitle: Text("https://github.com/h0nj"
          ),
        ),
      ],
    );
  }
}