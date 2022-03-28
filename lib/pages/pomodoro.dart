// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxteste/components/cronometro.dart';
import 'package:mobxteste/components/entradatempo.dart';
import 'package:mobxteste/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Cronometro()),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Observer(
                builder: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    EntradaTempo(
                      valor: store.tempoEstudo,
                      titulo: "Estudos",
                      inc: store.iniciado && store.estaEstudando()
                          ? null
                          : store.incrementarTempoEstudo,
                      dec: store.iniciado && store.estaEstudando()
                          ? null
                          : store.decrementarTempoEstudo,
                    ),
                    EntradaTempo(
                      valor: store.tempoDescanso,
                      titulo: "Descanso",
                      inc: store.iniciado && store.estaDescansando()
                          ? null
                          : store.incrementarTempoDescanso,
                      dec: store.iniciado && store.estaDescansando()
                          ? null
                          : store.decrementarTempoDescanso,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
