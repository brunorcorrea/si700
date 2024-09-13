import 'package:aula_04_layout_e_textformfield/bloc/auth_bloc_intro.dart';
import 'package:aula_04_layout_e_textformfield/view/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        home: BlocProvider(
            create: (context) => AuthBlocIntro(Unauthenticated()),
            child: Wrapper()));
  }
}
