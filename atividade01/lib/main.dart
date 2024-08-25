import 'package:flutter/material.dart';

import 'model/jogo_da_velha.dart';
import 'view/celula.dart';

void main() {
  runApp(MaterialApp(
    home: JogoDaVelhaApp(),
  ));
}

class JogoDaVelhaApp extends StatefulWidget {
  @override
  _JogoDaVelhaAppState createState() => _JogoDaVelhaAppState();
}

class _JogoDaVelhaAppState extends State<JogoDaVelhaApp> {
  JogoDaVelha jogo = JogoDaVelha();

  void _reiniciarJogo() {
    setState(() {
      jogo.reiniciarJogo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jogo da Velha')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Alinha o botão ao final
        children: [
          Expanded(
            child: Center(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,  // Número de colunas
                ),
                itemCount: 9,  // Número total de células
                itemBuilder: (context, index) {
                  return Celula(jogo: jogo, posicao: index);
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _reiniciarJogo,  // Chama a função para reiniciar o jogo
            child: Text('Reiniciar'),
          ),
        ],
      ),
    );
  }
}
