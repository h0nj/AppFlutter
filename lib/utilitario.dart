import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: utilitario(),
  ));
}

class utilitario extends StatefulWidget {
  @override
  _utilitarioState createState() => _utilitarioState();
}

class _utilitarioState extends State<utilitario> {

  double _tempoAPagar = 0;
  double _vlrInicialCasa = 0;
  double _vlraSerPagocmJuros = 0;
  int _time = 0;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    TextEditingController valorCasa = TextEditingController();
    TextEditingController pagamentoInicial = TextEditingController();
    TextEditingController tempoPagar = TextEditingController();

  void _resetFields()
  {
      valorCasa.text = '';
      pagamentoInicial.text = '';
      tempoPagar.text = '';
      setState(() {
          int _tempoAPagar = 0;
          double _vlrInicialCasa = 0;
          double _vlraSerPagocmJuros = 0;
      
        _formKey = GlobalKey<FormState>();
      });
  }

  void _calcular(){
    setState(()
    {

      double vlrCasa = double.parse(valorCasa.text);
      double pgtInicial = double.parse (pagamentoInicial.text);
      int tmpPagar = int.parse(tempoPagar.text);

      double vlrQuitar = vlrCasa - pgtInicial;
      double juros = (vlrQuitar * 2) / 100;
      double vlrQuitarJuros = vlrQuitar + juros;
      double tempoRestante = (vlrQuitarJuros / tmpPagar);

      _tempoAPagar = (tempoRestante);
      _vlrInicialCasa = (vlrCasa);
      _vlraSerPagocmJuros = (vlrQuitarJuros);
      _time = (tmpPagar);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculo Imobiliário"),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.house_rounded, size: 120.0, color: Colors.black),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Valor da casa",
                    labelStyle: TextStyle(color: Colors.black)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
                controller: valorCasa,
                validator: (value){
                  if(value!.isEmpty){
                    return "Insira o valor da casa";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Pagamento Inicial",
                    labelStyle: TextStyle(color: Colors.black)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
                controller: pagamentoInicial,
                validator: (value){
                  if(value!.isEmpty){
                    return "Insira o pagamento inicial";
                  }
                },
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Tempo a pagar (meses)",
                    labelStyle: TextStyle(color: Colors.black)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
                controller: tempoPagar,
                validator: (value){
                  if(value!.isEmpty){
                    return "Insira o tempo que deseja pagar!";
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50,
                  child: TextButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        _calcular();
                      }
                    },
                    child: Text('Calcular',style: TextStyle(color: Colors.white, fontSize: 20.0),),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child : Text('As parcelas a serem pagas serão de RS ' + _tempoAPagar.toString() + ' por mês, no periodo de ' +_time.toString() + ' meses',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20),
              )),
              Padding(padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child : Text('O valor da casa sem juros é RS ' +_vlrInicialCasa.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20),
              )),

              Padding(padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text('O valor da casa com juros, após o abate do valor inicial é RS ' + _vlraSerPagocmJuros.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20),
              )),
            ],
          ),
        )
      )
    );
  }
}