import 'package:flutter/material.dart';

class BeerOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Bottle(),
      ),
    );
  }
}

class Bottle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 300.0,
        width: 200.0,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 240.0,
              color: Colors.blue,
            ),
            Positioned(
              top: 0.0,
              bottom: 20.0,
              left: 80.0,
              right: 80,
              child: Container(
                width: 20,
                height: 100.0,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
