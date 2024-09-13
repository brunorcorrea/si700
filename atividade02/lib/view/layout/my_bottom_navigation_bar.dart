import 'package:atividade02/view/screens/primeira_tela.dart';
import 'package:atividade02/view/screens/segunda_tela.dart';
import 'package:atividade02/view/screens/terceira_tela.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyBottomNavigationBar"),
      ),
      body: IndexedStack(
        children: [PrimeiraTela(), SegundaTela(), TerceiraTela()],
        index: _currentScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreen,
        fixedColor: Colors.red,
        onTap: (value) {
          setState(() {
            _currentScreen = value;
          });
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.wifi), label: "asdf"),
        BottomNavigationBarItem(
            icon: Icon(Icons.four_g_mobiledata), label: "asdf"),
        BottomNavigationBarItem(
            icon: Icon(Icons.three_g_mobiledata), label: "asdf"),
      ]),
    );
  }
}
