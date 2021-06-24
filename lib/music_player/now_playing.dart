import 'package:flutter/material.dart';

class NowPlaying extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Content());
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/free-gaana-bb7d7.appspot.com/o/justin_back.png?alt=media'),
                    fit: BoxFit.contain,
                  )),
              height: 350.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /*InkWell(
                    onTap: () => print('open menu'),
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/free-gaana-bb7d7.appspot.com/o/menu_1.png?alt=media',
                      height: 30,
                    ),
                  ),*/
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 35.0,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () => print('open info'),
                    icon: Icon(
                      Icons.info_outline,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 150,
          bottom: 0,
          right: 0,
          left: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.0),
                topLeft: Radius.circular(50.0)),
            child: Container(
              color: Colors.white,
              child: Text('hello'),
            ),
          ),
        ),
      ],
    );
  }
}
