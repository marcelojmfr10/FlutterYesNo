import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    // notifica a todos los que estén escuchando
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    // Future<void> moveScrollToBottom() async {
    //   await Future.delayed(Duration(milliseconds: 100));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }
}
