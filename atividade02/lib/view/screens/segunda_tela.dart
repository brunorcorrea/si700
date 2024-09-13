import 'package:flutter/material.dart';

class SegundaTela extends StatelessWidget {
  const SegundaTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black, width: 4.0),
        gradient: LinearGradient(
          colors: [Colors.blue.shade100, Colors.blue.shade900],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3))
                ],
              ),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/106618112?v=4"),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                "Vinicius Lutaka",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(50),
              child: const Text(
                "Olá, eu sou programador Frontend, gosto de Flutter, React, Angular, Star Wars, ir pra igreja 🤲, ver aviões e jogar videojogos!",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    height: 1.5,
                    letterSpacing: 1.5),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email,
                  color: Colors.yellow,
                ),
                SizedBox(width: 20),
                Icon(Icons.link, color: Colors.yellow),
              ],
            )
          ],
        ),
      ),
    );
  }
}
