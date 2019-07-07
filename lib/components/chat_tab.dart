import 'package:flutter/material.dart';
import 'package:whatsclone/components/chat_list_tile.dart';
import 'package:whatsclone/models/person.dart';

class ChatTab extends StatefulWidget {
  @override
  _ChatTabState createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  @override
  void initState() {
    super.initState();
    print('starting chat tab');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/people.json'),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(
            child: Center(
              child: Text('sorry, an unexpected error happened'),
            ),
          );
        }

        if (!snapshot.hasData) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        List<Person> people = Person.fromJsonArray(snapshot.data.toString());

        return ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            final person = people[index];
            final lastMessage = person.messages.last;

            Widget result = ChatListTile(person: person, lastMessage: lastMessage);

            if (index == 0) {
              result = Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: result,
              );
            }

            return result;
          },
        );
      },
    );
  }
}
