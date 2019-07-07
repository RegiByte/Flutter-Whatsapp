import 'package:flutter/material.dart';

class CameraTab extends StatefulWidget {
  @override
  _CameraTabState createState() => _CameraTabState();
}

class _CameraTabState extends State<CameraTab> {
  @override
  void initState() {
    super.initState();
    print('starting camera tab');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('camera tab'),
      ),
    );
  }
}
