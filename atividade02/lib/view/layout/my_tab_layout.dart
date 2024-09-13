import 'package:atividade02/view/screens/primeira_tela.dart';
import 'package:atividade02/view/screens/segunda_tela.dart';
import 'package:atividade02/view/screens/terceira_tela.dart';
import 'package:flutter/material.dart';

class MyTabLayout extends StatelessWidget {
  const MyTabLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("MyTabLayout"),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.engineering), text: "Backend"),
            Tab(icon: Icon(Icons.monitor), text: "Frontend"),
            Tab(icon: Icon(Icons.edit_document), text: "Formulário")
          ])
          ),
          body: TabBarView(children: [PrimeiraTela(), SegundaTela(), TerceiraTela()])
      ),
    );
  }
}