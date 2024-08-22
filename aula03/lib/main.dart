import 'package:aula03/model/jogo_da_velha.dart';
import 'package:aula03/view/celula.dart';
import 'package:flutter/material.dart';

void main() {
  JogoDaVelha jogo = JogoDaVelha();
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Jogo da Velha')),
      body: Center(
        child: GridView.count(
          primary: false,
          crossAxisCount: 3,
          children: [
            Celula(jogo: jogo, posicao: 0),
            Celula(jogo: jogo, posicao: 1),
            Celula(jogo: jogo, posicao: 2),
            Celula(jogo: jogo, posicao: 3),
            Celula(jogo: jogo, posicao: 4),
            Celula(jogo: jogo, posicao: 5),
            Celula(jogo: jogo, posicao: 6),
            Celula(jogo: jogo, posicao: 7),
            Celula(jogo: jogo, posicao: 8)
          ],
        ),
      ),
    ),
  ));
}
