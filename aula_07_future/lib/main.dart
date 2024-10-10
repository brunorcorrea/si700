import 'dart:async';
import 'dart:math';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Random random = Random();
  final StreamController<String> controller = StreamController<String>();

  Future<String> pedirPizza() async {
    await Future.delayed(const Duration(seconds: 3));
    return "Pizza Chegou";
  }

  Future<void> esperar() async {
    await Future.delayed(const Duration(seconds: 3));
    print('Esperei por 3 segundos');
  }

  Future<void> esperarComErro() async {
    await Future.delayed(const Duration(seconds: 3));

    if (random.nextBool()) {
      print("Consegui passar sem erro");
    } else {
      throw 'Erro ao esperar';
    }
  }

  Stream<int> torneira() async* {
    int counter = 0;
    while (true) {
      await Future.delayed(const Duration(seconds: 3));

      counter += 1;
      yield counter;
    }
  }

  @override
  void initState() {
    controller.stream.listen(
      (String value) {
        print('Valor Chegou: $value');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  esperar();
                  print('Será que eu esperei?');
                },
                child: const Text('Esperar por 3 segundos, mas não parado')),
            ElevatedButton(
                onPressed: () async {
                  await esperar();
                  print('Será que eu esperei?');
                },
                child: const Text('Esperar por 3 segundos, parado')),
            ElevatedButton(
                onPressed: () {
                  try {
                    esperarComErro().onError((erro, stack) {
                      print(
                          'Consegui capturar o erro em paralelo: ${erro.toString()}');
                    });
                  } catch (e) {
                    print('Capturei erro: ${e.toString()}');
                  }
                  print('Será que eu esperei?');
                },
                child: const Text(
                    'Esperar por 3 segundos com erro, mas não parado')),
            ElevatedButton(
                onPressed: () async {
                  try {
                    await esperarComErro();
                  } catch (e) {
                    print('Capturei erro: ${e.toString()}');
                  }
                  print('Será que eu esperei?');
                },
                child: const Text('Esperar por 3 segundos com erro, parado')),
            ElevatedButton(
                onPressed: () {
                  esperar();
                  print('Será que eu esperei?');
                },
                child: const Text('Esperar por 3 segundos, mas não parado')),
            ElevatedButton(
                onPressed: () async {
                  await esperar();
                  print('Será que eu esperei?');
                },
                child: const Text('Esperar por 3 segundos, parado')),
            ElevatedButton(
                onPressed: () {
                  var x = pedirPizza();
                  x.then((value) {
                    print("Não esperei, mas dei um callback: $value");
                  });
                  print(x);
                },
                child: const Text('Pedir pizza, mas não parado')),
            ElevatedButton(
                onPressed: () async {
                  var x = await pedirPizza();
                  print(x);
                },
                child: const Text('Pedir pizza, parado')),
            ElevatedButton(
                onPressed: () {
                  Stream<int> aux = torneira();
                  aux.listen((int pingo) {
                    print('Pingo $pingo');
                  });
                },
                child: const Text('Ligar torneira')),
                ElevatedButton(
                onPressed: () {
                  controller.sink.add("nnn");
                },
                child: const Text('Inserir na Stream')),
          ],
        ),
      ),
    );
  }
}
