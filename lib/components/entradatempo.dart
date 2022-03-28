// ignore_for_file: prefer_const_constructors, unnecessary_this

import 'package:flutter/material.dart';
import 'package:mobxteste/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class EntradaTempo extends StatelessWidget {
  final int valor;
  final String titulo;
  final void Function()? inc; //funcao de incrementar
  final void Function()? dec; // funcao de decrementar
  // definindo as infos necessarias no construtor
  const EntradaTempo(
      {Key? key, required this.valor, required this.titulo, this.inc, this.dec})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(this.titulo, style: TextStyle(fontSize: 25)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: this.dec,
              child: Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                  primary: store.estaEstudando() ? Colors.red : Colors.green),
            ),
            Text(
              '${this.valor} min',
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: this.inc,
              child: Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                  primary: store.estaEstudando() ? Colors.red : Colors.green),
            ),
          ],
        ),
      ],
    );
  }
}
