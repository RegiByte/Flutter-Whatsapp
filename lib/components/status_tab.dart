import 'package:flutter/material.dart';

class StatusTab extends StatefulWidget {
  @override
  _StatusTabState createState() => _StatusTabState();
}

class _StatusTabState extends State<StatusTab> {
  @override
  void initState() {
    super.initState();
    print('starting status tab');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('center text'),
      ),
    );
  }
}
