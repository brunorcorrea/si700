import 'package:aula03/model/jogo_da_velha.dart';
import 'package:flutter/material.dart';

class Celula extends StatefulWidget {
  final JogoDaVelha jogo;
  final int posicao;

  Celula({required this.jogo, required this.posicao});

  @override
  State<Celula> createState() => _CelulaState();
}

class _CelulaState extends State<Celula> {
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

  _buildContent() {
    int estado = widget.jogo.obterEstadoPosicao(widget.posicao);

    if (estado == 1) {
      return const Text('X', style: TextStyle(fontSize: 48));
    } else if (estado == -1) {
      return const Text('O', style: TextStyle(fontSize: 48));
    } else {
      return Text('');
    }
  }

  _fazerJogada() {
    if (widget.jogo.jogar(widget.posicao)) {
      setState(() {});
    }
  }
}
