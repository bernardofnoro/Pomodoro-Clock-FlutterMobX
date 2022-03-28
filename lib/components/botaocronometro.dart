// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this

import 'package:flutter/material.dart';
import 'package:mobxteste/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class CronometroBotao extends StatelessWidget {
  final String texto;
  final IconData icone;
  final void Function()? clickrelogio;

  const CronometroBotao(
      {Key? key, required this.texto, required this.icone, this.clickrelogio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        textStyle: TextStyle(
          fontSize: 25,
        ),
      ),
      onPressed: this.clickrelogio,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icone,
              size: 35,
            ),
          ),
          Text(
            texto,
          ),
        ],
      ),
    );
  }
}
