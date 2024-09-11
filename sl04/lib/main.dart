import 'package:aula_04_layout_e_textformfield/view/layout/my_navigation_drawer.dart';
import 'package:aula_04_layout_e_textformfield/view/layout/my_tab_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyTabLayout());
  }
}
