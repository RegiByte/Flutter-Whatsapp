import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:whatsclone/components/chat_messages.dart';
import 'package:whatsclone/components/profile_avatar.dart';
import 'package:whatsclone/models/message.dart';
import 'package:whatsclone/models/person.dart';

class ChatScreen extends StatefulWidget {
  final Person person;
  final List<Message> messages;

  ChatScreen({this.person, this.messages});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final EmojiParser emojiParser = EmojiParser();

  @override
  void initState() {
    super.initState();
    print('welcome ${widget.person.firstName} to the chat!');
  }

  Widget _getPersonInfo() {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.person.fullName,
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            'online',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey[300],
            ),
          )
        ],
      ),
    );
  }

  _getActionButton({VoidCallback onPressed, Icon icon}) {
    return Container(
      width: 43.0,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }

  BoxDecoration _getBackgroundDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          'assets/background.png',
        ),
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(.85),
          BlendMode.dstOut,
        ),
        repeat: ImageRepeat.repeat,
      ),
      color: Color(0xFFECE5DD).withOpacity(.5),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            children: <Widget>[
              ProfileAvatar(
                url: widget.person.smallPicture,
                size: 30,
              ),
              SizedBox(
                width: 10.0,
              ),
              _getPersonInfo()
            ],
          ),
        ),
        actions: <Widget>[
          _getActionButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              print('started recording');
            },
          ),
          _getActionButton(
            onPressed: () {
              print('started audio call');
            },
            icon: Icon(
              Icons.call,
              color: Colors.white,
            ),
          ),
          _getActionButton(
            onPressed: () {
              print('more');
            },
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
        titleSpacing: 1.0,
      ),
      body: SafeArea(
        child: Container(
          decoration: _getBackgroundDecoration(),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ChatMessages(
                  messages: widget.messages,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: orientation == Orientation.portrait ? 8 : 14,
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 40.0,
                              height: 40.0,
                              child: IconButton(
                                onPressed: () {
                                  print('open emoji keyboard');
                                },
                                color: Colors.grey,
                                icon: Icon(Icons.insert_emoticon),
                              ),
                            ),
                            Flexible(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Type a message',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              width: 30.0,
                              height: 40.0,
                              child: IconButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () {
                                  print('attaching file');
                                },
                                color: Colors.grey,
                                icon: Icon(Icons.attach_file),
                              ),
                            ),
                            Container(
                              width: 30.0,
                              height: 40.0,
                              child: IconButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () {
                                  print('opening camera');
                                },
                                color: Colors.grey,
                                icon: Icon(Icons.camera_alt),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: MaterialButton(
                        onPressed: () {
                          print('recording audio');
                        },
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: Center(
                          child: Icon(
                            Icons.keyboard_voice,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
