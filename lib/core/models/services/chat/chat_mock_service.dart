import 'dart:async';
import 'dart:math';

import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/models/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msg = [
    // ChatMessage(
    //   id: '1',
    //   text: 'Bom dia',
    //   createAt: DateTime.now(),
    //   userId: '123',
    //   userName: 'João',
    //   userImageUrl: 'assets/images/avatar.png',
    // ),
    // ChatMessage(
    //   id: '2',
    //   text: 'Bom dia! Teremos Reunião hoje?',
    //   createAt: DateTime.now(),
    //   userId: '456',
    //   userName: 'Maria',
    //   userImageUrl: 'assets/images/avatar.png',
    // ),
    // ChatMessage(
    //   id: '3',
    //   text: 'Bom dia. Sim! As 10:00',
    //   createAt: DateTime.now(),
    //   userId: '789',
    //   userName: 'Eduardo',
    //   userImageUrl: 'assets/images/avatar.png',
    // )
  ];

  static MultiStreamController<List<ChatMessage>>? _controller;

  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msg);
  });

  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageUrl: user.imageUrl,
    );
    _msg.add(newMessage);
    _controller?.add(_msg.reversed.toList());
    return newMessage;
  }
}
