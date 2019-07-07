class Message {
  final int id;
  final String body;
  final DateTime date;
  final bool fromMe;

  Message({
    this.id,
    this.body,
    this.date,
    this.fromMe,
  });

  static List<Message> fromArray(List<dynamic> messagesArray) {
    List<Message> messages = [];

    for (final message in messagesArray) {
      messages.add(Message(
        id: message['id'],
        body: message['body'],
        date: DateTime.parse(message['date']),
        fromMe: message['from_me'],
      ));
    }

    return messages;
  }
}
