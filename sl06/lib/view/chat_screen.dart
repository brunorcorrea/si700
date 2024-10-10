import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:sl06/bloc/chat_bloc.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text("Chat Screen"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Digite sua mensagem...',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String message = _textEditingController.text;

                  if (message.isNotEmpty) {
                    _textEditingController.clear();

                    context.read<ChatBloc>().add(UserEvent(message: message));
                  }
                },
                child: const Text("Enviar"),
              ),
              const HtmlWidget('<h2>Mensagens</h2>'),
              Expanded(
                child: BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    return SingleChildScrollView(
                      child: HtmlWidget(
                        state.chatValue.isNotEmpty
                            ? state.chatValue
                            : "<p>Nenhuma mensagem ainda</p>",
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
