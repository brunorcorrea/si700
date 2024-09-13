import 'package:atividade02/provider/sheets_provider.dart';
import 'package:atividade02/view/screens/feedback_screen.dart';
import 'package:flutter/material.dart';

class TerceiraTela extends StatefulWidget {
  const TerceiraTela({super.key});

  @override
  State<TerceiraTela> createState() => _TerceiraTelaState();
}

class _TerceiraTelaState extends State<TerceiraTela> {
  String nome = "";
  bool _termsAccepted = false;
  int _selectedOption = 1;
  String? _selectedCategory;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu nome';
                }
                return null;
              },
              onSaved: (value) {
                nome = value!;
              },
            ),
            CheckboxListTile(
              title: Text('Aceito os termos e condições'),
              value: _termsAccepted,
              onChanged: (bool? value) {
                setState(() {
                  _termsAccepted = value ?? false;
                });
              },
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('Celular'),
                  value: 1,
                  groupValue: _selectedOption,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Notebook'),
                  value: 2,
                  groupValue: _selectedOption,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  hint: Text('Selecione uma categoria'),
                  items: ['Dúvida', 'Sugestão', 'Reclamação']
                      .map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, selecione uma categoria';
                    }
                    return null;
                  },
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  },
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  String deviceName = _selectedOption == 1 ? 'Celular' : 'Notebook';
                  String type = _selectedCategory ?? '-';

                  Future<String?> futureResult = SheetsDatabase.helper
                      .submitData([nome, _termsAccepted ? "aceitou" : "não aceitou", deviceName, type]);
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          color: Colors.grey[900], // Fundo da BottomSheet
                          child: FeedbackScreen(futureResult: futureResult),
                        );
                      });
                }
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
