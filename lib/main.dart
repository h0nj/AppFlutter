import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/DatabaseHelper.dart';
import 'principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WidgetLogin(),
    );
  }
}

class WidgetLogin extends StatefulWidget {
  const WidgetLogin({Key? key}) : super(key: key);

  @override
  State<WidgetLogin> createState() => _WidgetLoginState();
}

class _WidgetLoginState extends State<WidgetLogin> {
  TextStyle style =
      const TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold);


  String logado   = " ";
  String email    = "";
  String password = "";

  void loginRealizado() {
    setState(() {
      if (email.isEmpty && password.isEmpty) {
        logado = "Login não pode ser realizado, verifique suas informações.";
      } else if(email == "jhonatazadesouza@hotmail.com" && password == "123456") {
        logado = "Bem Vindo.";
        // Navigator.push(context, MaterialPageRoute(builder: (context) => MyAppAlt()));
        Navigator.push(context, MaterialPageRoute(
          builder: (_) => principal()
        ));
      } else {
        logado = "Login inválido, verifique as informações.";
      }      
    });
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      onChanged: (text){
        email = text;
      },
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'E-mail',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

    final passwordField = TextField(
      onChanged: (text){
        password = text;
      },
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Senha',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

    final buttonLogin = ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      child: ElevatedButton(
          child: Text(
            'Entrar',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
            ),
          onPressed: () {
            loginRealizado();            
          },
        ),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 300,
                  width: 200,
                  child: Image.asset("assets/images/login.png"),
                ),
                const SizedBox(height: 25),
                emailField,
                const SizedBox(height: 25),
                passwordField,
                const SizedBox(height: 25),
                buttonLogin,
                const SizedBox(height: 25),
                Text(
                  '$logado',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}