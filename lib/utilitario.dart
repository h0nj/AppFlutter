// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'principal.dart';

class utilitario extends StatefulWidget {
  const utilitario({super.key});

  @override
  State<utilitario> createState() => _utilitarioState();
}

class _utilitarioState extends State<utilitario> {
  TextStyle _textStyle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600);
  static final NumberFormat formatoReal =
      NumberFormat.currency(locale: 'pt_BR');
  double _investimentoMensal = 0;
  int _anosInvestindo = 0;
  int _rentabilidadeAnual = 0;
  double _valorInvestido = 0;
  double _jurosAcumulados = 0;
  double _resultado = 0;

  atualizarValorInvestido() {
    setState(() {
      _valorInvestido = _investimentoMensal * (_anosInvestindo * 12);
    });
  }

  atualizarResultado() {
    setState(() {
      _resultado = (_investimentoMensal *
              (pow(1 + (_rentabilidadeAnual / 12 / 100),
                      (_anosInvestindo * 12)) -
                  1)) /
          (_rentabilidadeAnual / 12 / 100);
    });
  }

  atualizarJurosAcumulado() {
    setState(() {
      _jurosAcumulados = _resultado - _valorInvestido;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10.0),
            Text('Calcule a Rentabilidade',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                )),
            SizedBox(height: 10),
            // ignore: prefer_const_constructors
            Card(
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 8),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: <Widget>[
                            Text('Investimento mensal:', style: _textStyle),
                            Spacer(),
                            Text('${formatoReal.format(_investimentoMensal)}',
                                style: _textStyle),
                          ],
                        ),
                      ),
                      Slider(
                        value: _investimentoMensal,
                        min: 0,
                        max: 10000,
                        activeColor: Colors.black,
                        inactiveColor: Colors.green.shade100,
                        divisions: 1000,
                        onChanged: (double value) {
                          setState(() {
                            _investimentoMensal = value;
                          });
                          atualizarResultado();
                          atualizarValorInvestido();
                          atualizarJurosAcumulado();
                        },
                      ),
                    ],
                  )),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 8),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: <Widget>[
                            Text('Tempo Investido (anos):', style: _textStyle),
                            Spacer(),
                            Text(
                              _anosInvestindo.toString() + ' anos',
                              style: _textStyle,
                            ),
                          ],
                        ),
                      ),
                      Slider(
                        value: _anosInvestindo.toDouble(),
                        min: 0,
                        max: 50,
                        activeColor: Colors.black,
                        inactiveColor: Colors.white,
                        divisions: 50,
                        onChanged: (double value) {
                          setState(() {
                            _anosInvestindo = value.toInt();
                          });
                          atualizarResultado();
                          atualizarValorInvestido();
                          atualizarJurosAcumulado();
                        },
                      ),
                    ],
                  )),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 8),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: <Widget>[
                            Text('Rentabilidade anual:', style: _textStyle),
                            Spacer(),
                            Text(
                              _rentabilidadeAnual.toString() + '%',
                              style: _textStyle,
                            )
                          ],
                        ),
                      ),
                      Slider(
                        value: _rentabilidadeAnual.toDouble(),
                        min: 0,
                        max: 25,
                        activeColor: Colors.black,
                        inactiveColor: Colors.white,
                        divisions: 25,
                        onChanged: (double value) {
                          setState(() {
                            _rentabilidadeAnual = value.toInt();
                          });
                          atualizarResultado();
                          atualizarValorInvestido();
                          atualizarJurosAcumulado();
                        },
                      ),
                    ],
                  )),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 30),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Resultado',
                          style: _textStyle,
                        ),
                        Text('${formatoReal.format(_resultado)}',
                            style: _textStyle),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Valor Investido',
                          style: _textStyle,
                        ),
                        Text('${formatoReal.format(_valorInvestido)}',
                            style: _textStyle),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Juros Acumulado',
                          style: _textStyle,
                        ),
                        Text('${formatoReal.format(_jurosAcumulados)}',
                            style: _textStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            TextButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (_) => principal()
              ));
            }, child: Text('Voltar'),)
          ],
        ),
      ),
    );
  }
}
