// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxteste/components/botaocronometro.dart';
import 'package:mobxteste/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Observer(
      builder: (_) {
        return Container(
          color: store.estaEstudando() ? Colors.red : Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                store.estaEstudando()
                    ? 'Hora de Estudar'
                    : 'Hora de descansar!',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 120, color: Colors.white),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!store.iniciado)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CronometroBotao(
                        texto: "Iniciar",
                        icone: Icons.play_arrow,
                        clickrelogio: store.iniciar,
                      ),
                    ),
                  if (store.iniciado)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CronometroBotao(
                        texto: "Parar",
                        icone: Icons.stop,
                        clickrelogio: store.parar,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CronometroBotao(
                      texto: "Reiniciar",
                      icone: Icons.refresh,
                      clickrelogio: store.reiniciar,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
