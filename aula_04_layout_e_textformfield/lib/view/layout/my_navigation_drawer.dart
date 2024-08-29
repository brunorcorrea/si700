import 'package:aula_04_layout_e_textformfield/view/screens/primeira_tela.dart';
import 'package:aula_04_layout_e_textformfield/view/screens/segunda_tela.dart';
import 'package:aula_04_layout_e_textformfield/view/screens/terceira_tela.dart';
import 'package:flutter/material.dart';

class MyNavigationDrawer extends StatefulWidget {
  const MyNavigationDrawer({super.key});

  @override
  State<MyNavigationDrawer> createState() => _MyNavigationDrawerState();
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer> {
  int _currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyNavigationDrawer"),
      ),
      body: IndexedStack(
        index: _currentScreen,
        children: const [PrimeiraTela(), SegundaTela(), TerceiraTela()],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Container(
              color: Colors.black,
            )),
            ListTile(
              onTap: () {
                setState(() {
                  _currentScreen = 0;
                });
                Navigator.pop(context);
              },
              leading: const Icon(Icons.golf_course_rounded),
              title: const Text("Primeira Tela"),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  _currentScreen = 1;
                });
                Navigator.pop(context);
              },
              leading: const Icon(Icons.security_update_good_rounded),
              title: const Text("Segunda Tela"),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  _currentScreen = 2;
                });
                Navigator.pop(context);
              },
              leading: const Icon(Icons.work_outline_rounded),
              title: const Text("Terceira Tela"),
            )
          ],
        ),
      ),
    );
  }
}
