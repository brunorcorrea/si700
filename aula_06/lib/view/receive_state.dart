import 'package:aula_06/bloc/red_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReceiveState extends StatelessWidget {
  const ReceiveState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RedBloc, RedState>(
        builder: (BuildContext context, RedState state) {
          return Container(color: Color.fromRGBO(state.amount, 0, 0, 1));
        });
  }
}
