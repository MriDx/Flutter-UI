import 'package:flutter/material.dart';

final MENU = 0;
final BACK = 1;

class CAppBar extends StatelessWidget {
  Function(int i) onClicked;
  int type;
  bool showRightIcon;
  CAppBar({@required this.onClicked, this.type = 0, this.showRightIcon = true});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 56,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => onClicked(0),
              child: Icon(
                type == MENU ? Icons.menu : Icons.arrow_back_ios,
                size: 30,
                color: Colors.black,
              ),
            ),
            showRightIcon
                ? InkWell(
                    onTap: () => onClicked(1),
                    child: Icon(
                      Icons.person_outline,
                      size: 30,
                      color: Colors.black,
                    ),
                  )
                : SizedBox(
                    width: 1,
                  ),
          ],
        ),
      ),
    );
  }
}
