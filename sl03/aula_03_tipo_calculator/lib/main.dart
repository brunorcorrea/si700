import 'package:aula_03_tipo_calculator/tip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Gorgetita Calculator',
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
  Tip tip = Tip();

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
            Text(("DefaultTippedAmount: ${tip.defaultTippedAmount}")),
            Text("CustomTippedAmount: ${tip.customTippedAmount}"),
            Text("AmountPlusDefaultTippedAmount: ${tip.amountPlusDefaultTippedAmount}"),
            Text("AmountPlusCustomTippedAmount: ${tip.amountPlusCustomTippedAmount}"),
            TextFormField(
              initialValue: tip.amount,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                tip.amount = value;
                setState(() {});
              },
              decoration: const InputDecoration(labelText: 'Valor Total'),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))
              ],
            ),
            InputDecorator(
                decoration:
                    const InputDecoration(labelText: 'Gorjeta Customizada'),
                child: Slider(
                  min: 1,
                  max: 100,
                  value: double.parse(tip.customTip),
                  onChanged: (value) {
                    tip.customTip = value.toString();
                    setState(() {});
                  },
                ))
          ],
        ),
      ),
    );
  }
}
