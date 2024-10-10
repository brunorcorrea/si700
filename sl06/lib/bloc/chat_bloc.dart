import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sl06/provider/chat_provider.dart';

abstract class ChatEvent {
  String message;

  ChatEvent({required this.message});
}

class UserEvent extends ChatEvent {
  UserEvent({required super.message});
} 

class ServerEvent extends ChatEvent {
  ServerEvent({required super.message});
}
//Toda vez que o estado é emitido, o histórico de mensagens deve ser atualizado.
class ChatState {
  String chatValue;

  ChatState({this.chatValue = ''});

  void updateChatHistory(ChatEvent event) {
    chatValue += '\n${event.message}';
  }
}

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState()) {
    ChatProvider.helper.stream.listen((String resposta) {
      add(ServerEvent(message: resposta));
    });
  }

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    // Recupera o histórico atual do chat
    String lChat = state.chatValue;

    if (event is UserEvent) {
      // Mensagem do usuário, alinha à direita
      yield ChatState(
        chatValue: "$lChat\n<h3 align='right'>${event.message}</h3>",
      );
    } else if (event is ServerEvent) {
      // Mensagem do servidor, alinha à esquerda
      yield ChatState(
        chatValue: "$lChat\n<h3 align='left'>${event.message}</h3>",
      );
    }
  }
}