import 'package:flutter/material.dart';

class PrimeiraTela extends StatefulWidget {
  const PrimeiraTela({super.key});

  @override
  State<PrimeiraTela> createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  String nome = "Bruno Ricardo Corrêa";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black, width: 4.0)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                  "https://avatars.githubusercontent.com/u/60991787?v=4",
                  width: 500,
                  height: 500,
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
            "Nome: $nome",
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                letterSpacing: 2),
          ),
          ),
          Container(
            margin: const EdgeInsets.all(50),
            child: const Text(
            "Olá, eu sou programador Backend, gosto de Java, Python, C#, Star Wars, ir pra igreja 🤲, ver aviões e jogar videojogos!",
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                letterSpacing: 2),
          )
          )
        ],
      ),
    );
  }
}
