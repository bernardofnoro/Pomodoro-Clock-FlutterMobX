// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum TipoIntervalo { ESTUDO, DESCANSO }

abstract class _PomodoroStore with Store {
  @observable
  bool iniciado = false;

  @observable
  int minutos = 2;
  @observable
  int segundos = 0;

  @observable
  int tempoEstudo = 2;

  @observable
  int tempoDescanso = 1;

  @observable
  TipoIntervalo tipoIntervalo = TipoIntervalo.ESTUDO;

  Timer? cronometro;

  @action
  void iniciar() {
    iniciado = true;
    cronometro = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (minutos == 0 && segundos == 0) {
        _trocarTipoIntervalo();
      } else if (segundos == 0) {
        segundos = 59;
        minutos--;
      } else {
        segundos--;
      }
    });
  }

  @action
  void parar() {
    iniciado = false;
    cronometro?.cancel();
  }

  @action
  void reiniciar() {
    parar();
    minutos = estaEstudando() ? tempoEstudo : tempoDescanso;
    segundos = 0;
  }

  @action
  void incrementarTempoEstudo() {
    tempoEstudo++;
    if (estaEstudando()) {
      reiniciar();
    }
  }

  @action
  void decrementarTempoEstudo() {
    if (tempoEstudo > 1) {
      tempoEstudo--;
      if (estaEstudando()) {
        reiniciar();
      }
    }
  }

  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
    if (estaDescansando()) {
      reiniciar();
    }
  }

  @action
  void decrementarTempoDescanso() {
    if (tempoDescanso > 1) {
      tempoDescanso--;
      if (estaDescansando()) {
        reiniciar();
      }
    }
  }

  bool estaEstudando() {
    return tipoIntervalo == TipoIntervalo.ESTUDO;
  }

  bool estaDescansando() {
    return tipoIntervalo == TipoIntervalo.DESCANSO;
  }

  void _trocarTipoIntervalo() {
    if (estaEstudando()) {
      tipoIntervalo = TipoIntervalo.DESCANSO;
      minutos = tempoDescanso;
    } else {
      tipoIntervalo = TipoIntervalo.ESTUDO;
      minutos = tempoEstudo;
    }
    segundos = 0;
  }
}
