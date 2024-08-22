import 'package:aula03/model/jogo_da_velha.dart';
import 'package:flutter/material.dart';

class Celula extends StatefulWidget {
  final JogoDaVelha jogo;
  final int posicao;

  Celula({required this.jogo, required this.posicao});

  @override
  _CelulaState createState() => _CelulaState();
}

class _CelulaState extends State<Celula> {

  _buildContent() {
    int estado = widget.jogo.obterEstadoPosicao(widget.posicao);
    String result = '';
    if (estado == -1) {
      result = 'O';
    }
    if (estado == 1) {
      result = 'X';
    }
    return Text(result, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30));
  }

  _fazerJogada() {
    bool isValid = widget.jogo.jogar(widget.posicao);
    if(isValid) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _fazerJogada,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        alignment: Alignment.center,
        child: _buildContent(),
      ),
    );
  }
}
