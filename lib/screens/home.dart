import 'package:flutter/material.dart';
import 'package:whatsclone/components/calls_tab.dart';
import 'package:whatsclone/components/camera_tab.dart';
import 'package:whatsclone/components/chat_tab.dart';
import 'package:whatsclone/components/padded_header_tab.dart';
import 'package:whatsclone/components/status_tab.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          elevation: 5.0,
          title: Text('WhatsApp'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.camera_alt,
                ),
              ),
              PaddedHeaderTab(
                text: 'CHAT',
              ),
              PaddedHeaderTab(
                text: 'STATUS',
              ),
              PaddedHeaderTab(
                text: 'CALLS',
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: <Widget>[
              CameraTab(),
              ChatTab(),
              StatusTab(),
              CallsTab(),
            ],
          ),
        ),
      ),
    );
  }
}
