import 'package:flutter/material.dart';

class BtmNav extends StatelessWidget {
  Function(int tab) onItemPressed;
  int selected;

  BtmNav({this.onItemPressed, @required this.selected});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[700],
        currentIndex: selected,
        onTap: onItemPressed,
        items: _btmNavItems,
      ),
    );
  }
}

const _btmNavItems = [
  BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Home'),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.bookmark,
      ),
      label: 'Saved'),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
      ),
      label: 'Profile'),
];
