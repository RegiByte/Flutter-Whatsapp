import 'package:flutter/material.dart';

class CallsTab extends StatefulWidget {
  @override
  _CallsTabState createState() => _CallsTabState();
}

class _CallsTabState extends State<CallsTab> {
  @override
  void initState() {
    super.initState();
    print('starting calls tab');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('this is calls tab'),
      ),
    );
  }
}
