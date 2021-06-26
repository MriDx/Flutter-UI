import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/artfiber/component/component.dart';
import 'package:ui/artfiber/ui/home/pages.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BtmNav(
        onItemPressed: (tab) {
          setState(() {
            selectedTab = tab;
          });
        },
        selected: selectedTab,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CAppBar(
              onClicked: (i) {
                if (i == 0) {
                  _scaffoldKey.currentState.openDrawer();
                }
              },
            ),
            PageHolder(
              child: pages[selectedTab],
            ),
          ],
        ),
      ),
    );
  }
}
