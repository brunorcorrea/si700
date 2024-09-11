import 'package:aula_06/bloc/red_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendEvent extends StatelessWidget{
  const SendEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(onPressed: () {
        BlocProvider.of<RedBloc>(context).add(SemRed());
      }, child: Text("Sem")),
      ElevatedButton(onPressed: () {
         BlocProvider.of<RedBloc>(context).add(PoucoRed());
      }, child: Text("Pouco")),
      ElevatedButton(onPressed: () {
         BlocProvider.of<RedBloc>(context).add(NormalRed());
      }, child: Text("Normal")),
      ElevatedButton(onPressed: () {
         BlocProvider.of<RedBloc>(context).add(MuitoRed());
      }, child: Text("Muito")),
    ],);
  }
}