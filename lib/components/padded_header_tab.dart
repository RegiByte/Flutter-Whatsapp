import 'package:flutter/material.dart';

class PaddedHeaderTab extends StatelessWidget {
  final String text;

  PaddedHeaderTab({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 13.0),
      child: Tab(
        text: text,
      ),
    );
  }
}
