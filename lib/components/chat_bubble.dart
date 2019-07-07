import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsclone/models/message.dart';

class ChatBubble extends StatelessWidget {
  final Message message;

  ChatBubble({this.message});

  @override
  Widget build(BuildContext context) {
    var viewed = Random().nextBool();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment:
            message.fromMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            borderRadius: BorderRadius.all(Radius.circular(7.5)),
            elevation: 1.0,
            color: message.fromMe ? Color(0xFFDCf8C6) : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 48),
                    child: Text(message.body),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Row(
                      children: <Widget>[
                        Text(
                          DateFormat.Hm().format(message.date),
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.grey[600]),
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        if (message.fromMe)
                          Icon(
                            viewed ? Icons.done_all : Icons.done,
                            color: viewed ? Colors.blue : Colors.black54,
                            size: 12,
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
