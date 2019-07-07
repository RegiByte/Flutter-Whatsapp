import 'package:flutter/material.dart';
import 'package:whatsclone/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff075E54),
        accentColor: Color(0xff25D366),
      ),
      initialRoute: HomeScreen.id,
      routes: {HomeScreen.id: (context) => HomeScreen()},
    );
  }
}
