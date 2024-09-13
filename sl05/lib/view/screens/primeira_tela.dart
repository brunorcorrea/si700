import 'package:aula_04_layout_e_textformfield/bloc/auth_bloc_intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrimeiraTela extends StatefulWidget {
  const PrimeiraTela({super.key});

  @override
  State<PrimeiraTela> createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  String login = "";
  String password = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(label: Text("Login")),
                onSaved: (String? newValue) {
                  login = newValue ?? "";
                },
                validator: (String? value) {
                  if (value != null) {
                    if (value.length < 3) {
                      return "Erro: Login não permite menos três letras";
                    } else {
                      return null;
                    }
                  } else {
                    return "Erro: Insira seu login";
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(label: Text("Password")),
                onSaved: (String? newValue) {
                  password = newValue ?? "";
                },
                validator: (String? value) {
                  if (value != null) {
                    if (value.length < 3) {
                      return "Erro: Senha não permite menos três letras";
                    } else {
                      return null;
                    }
                  } else {
                    return "Erro: Insira sua senha";
                  }
                },
              ),
              BlocBuilder<AuthBlocIntro, AuthState>(
                builder: (BuildContext context, AuthState state) {
                  if (state is Unauthenticated) {
                    return Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              BlocProvider.of<AuthBlocIntro>(context).add(
                                LoginUser(username: login, password: password),
                              );
                            }
                          },
                          child: const Text("Efetuar Login"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              BlocProvider.of<AuthBlocIntro>(context).add(
                                RegisterUser(
                                    username: login, password: password),
                              );
                            }
                          },
                          child: const Text("Registrar Novo Usuário"),
                        )
                      ],
                    );
                  } else {
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthBlocIntro>(context).add(Logout());
                      },
                      child: const Text("Deslogar"),
                    );
                  }
                },
              )
            ],
          )),
    );
  }
}
