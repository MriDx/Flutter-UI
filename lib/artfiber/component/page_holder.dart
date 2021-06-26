import 'package:flutter/material.dart';

class PageHolder extends StatelessWidget {
  Widget child;
  PageHolder({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: child,
    );
  }
}
