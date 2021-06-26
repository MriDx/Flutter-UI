import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    offset: Offset(2, 4),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 0.3) / 2,
                    width: (MediaQuery.of(context).size.height * 0.3) / 2,
                    child: CircleAvatar(
                      child: Text('M'),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Mridul Baishya',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      Text(
                        'Software Developer',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
