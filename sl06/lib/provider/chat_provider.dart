import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sl06/bloc/chat_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:convert';  // Para decodificar JSON, se necessário
import 'package:http/http.dart' as http;

// Simulação do ChatProvider
class ChatProvider {
  // Singleton para garantir que só haja uma instância
  static final ChatProvider _instance = ChatProvider._createInstance();
  static ChatProvider get helper => _instance;
  final StreamController<String> _controller = BehaviorSubject<String>();

  // Lista de mensagens predefinidas para simular respostas do servidor
  final List<String> _messages = [
    "Olá, como vai você?",
    "Como posso lhe ajudar hoje?",
    "Como você está se sentindo?"
  ];

  // Construtor privado
  ChatProvider._createInstance() {
    // Simula respostas automáticas a cada 5 segundos
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      final randomMessage = _messages[timer.tick % _messages.length];
      _controller.sink.add(randomMessage);
    });

    // Conexão com WebSocket
    _connectToWebSocket();
  }

  // Conectar ao WebSocket
  void _connectToWebSocket() {
    IO.Socket socket = IO.io(
      "https://1ba9a98e-f785-4605-aa8b-39d46644fe96-00-2zj8tzqdbk2pg.picard.replit.dev/",
      IO.OptionBuilder().setTransports(['websocket']).build(),
    );

    socket.on('server_information', (data) {
      // Verifica o tipo de dados recebido e formata conforme necessário
      String formattedData;
      if (data is Map) {
        formattedData = data.entries.map((entry) => '${entry.key}:${entry.value}').join('; ');
      } else {
        formattedData = data.toString();
      }

      _controller.sink.add(formattedData);
    });
  }

  // Método getter para acessar a stream
  Stream<String> get stream => _controller.stream;

  // Método para adicionar uma mensagem (simulando o envio do usuário)
  void addMessage(String message) {
    _controller.sink.add(message);
  }

  // Fecha o StreamController quando não for mais necessário
  void dispose() {
    _controller.close();
  }
}
