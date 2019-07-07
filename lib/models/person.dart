import 'dart:convert';

import 'package:whatsclone/models/message.dart';

class Person {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String picture;
  final String smallPicture;
  final String about;
  final String phone;
  final List<Message> messages;

  Person({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.picture,
    this.smallPicture,
    this.about,
    this.phone,
    this.messages = const [],
  });

  static List<Person> fromJsonArray(String json) {
    List<Person> people = [];
    final data = jsonDecode(json);

    for (final person in data) {
      people.add(Person(
        id: person['id'],
        firstName: person['first_name'],
        lastName: person['last_name'],
        email: person['email'],
        picture: person['picture'],
        smallPicture: person['small_picture'],
        about: person['about'],
        phone: person['phone'],
        messages: Message.fromArray(person['messages']),
      ));
    }
    return people;
  }

  String get fullName {
    return firstName + ' ' + lastName;
  }
}
