import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui/artfiber/onboardding.dart';
import 'package:ui/beer1/home.dart';
import 'package:ui/color.dart';
import 'package:ui/doctor_consultant_ui/doctor_consultant_ui.dart';
import 'package:ui/job_finder_ui/job_finder_ui_01.dart';
import 'package:ui/login_ui/login_1.dart';
import 'package:ui/other/chart_test.dart';
import 'package:ui/travel_ui/travel_ui.dart';
import 'package:ui/twitter/homepage.dart';

import 'PetAdoptionUI/PetAdoptionUI.dart';

MyColors _myColors = MyColors();

void main() => runApp(MyApp1());

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}

class MyExp extends StatefulWidget {
  @override
  _MyExpState createState() => _MyExpState();
}

class _MyExpState extends State<MyExp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 2,
      width: size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: createList(
            size: size,
            startHeight: 500.0,
            endHeight: 150.0,
            color: Colors.red),
      ),
      //color: Colors.purple,
    );
  }
}

List<Widget> createList(
    {Size size, double startHeight, double endHeight, Color color}) {
  var list = <Widget>[];
  var toSubtract = (startHeight - endHeight) / size.width;
  for (var i = 0; i < size.width.toInt(); i++) {
    list.add(Container(
      color: getColor(i),
      width: 1,
      height: startHeight - (toSubtract * i),
    ));
  }
  return list;
}

getColor(int i) {
  //print(i <= _myColors.colors.length ? i : i - (_myColors.colors.length + 1));

  print(i < _myColors.colors.length
      ? _myColors.colors[i]
      : _myColors.colors[i - _myColors.colors.length]);
  print(i);

  /*print(_myColors.colors.length);
  print(_myColors.colors[257]);*/
  //return Colors.purple;
  /*return i < _myColors.colors.length
      ? _myColors.colors[i]
      : _myColors.colors[i - _myColors.colors.length];*/
  return _myColors.colors[Random.secure().nextInt(258)];
}
