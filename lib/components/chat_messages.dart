import 'package:flutter/material.dart';
import 'package:whatsclone/components/chat_bubble.dart';
import 'package:whatsclone/models/message.dart';

class ChatMessages extends StatelessWidget {
  final List<Message> messages;

  ChatMessages({this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          Message message = messages[index];

          return ChatBubble(
            message: message,
          );
        });
  }
}
