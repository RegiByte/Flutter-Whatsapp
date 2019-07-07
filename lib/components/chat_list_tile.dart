import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsclone/components/profile_avatar.dart';
import 'package:whatsclone/models/message.dart';
import 'package:whatsclone/models/person.dart';
import 'package:whatsclone/screens/chat.dart';

class ChatListTile extends StatelessWidget {
  final Person person;
  final Message lastMessage;

  ChatListTile({this.person, this.lastMessage});

  Widget _getPicture() {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          ProfileAvatar(
            url: person.smallPicture,
            size: 60.0,
          ),
        ],
      ),
    );
  }

  Widget _getUserNameAndLastMessageOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            '${person.firstName} ${person.lastName}',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          children: <Widget>[
            if (lastMessage.fromMe) ...[
              Icon(
                Icons.check,
                color: Random().nextBool() ? Colors.blue : Colors.grey,
                size: 20.0,
              ),
              SizedBox(
                width: 3.0,
              ),
            ],
            Text(
              lastMessage.body.length > 35
                  ? lastMessage.body.substring(0, 33) + '...'
                  : lastMessage.body,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _getLastMessageDateAndConversationMuteIcon() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10.0,
        top: 8.0,
      ),
      child: Column(
        children: <Widget>[
          Text(
            DateFormat.Hm().format(lastMessage.date),
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
          if (lastMessage.fromMe) ...[
            SizedBox(
              height: 5,
            ),
            Icon(
              Icons.volume_off,
              color: Colors.grey,
            )
          ]
        ],
      ),
    );
  }

  Widget _getUserInformation() {
    return Expanded(
      flex: 9,
      child: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _getUserNameAndLastMessageOverview(),
                  _getLastMessageDateAndConversationMuteIcon()
                ],
              ),
            ),
            Divider(
              height: 1.0,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ChatScreen(
                person: person,
                messages: person.messages,
              );
            },
          ),
        );
      },
      child: Container(
        height: 80.0,
        child: Row(
          children: <Widget>[
            _getPicture(),
            _getUserInformation(),
          ],
        ),
      ),
    );
  }
}
