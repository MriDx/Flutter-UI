import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:ui/artfiber/component/component.dart';

class SingleProductViewUI extends StatelessWidget {
  String data;
  SingleProductViewUI(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: 10, right: 10),
          children: [
            CAppBar(
              onClicked: (i) {
                Navigator.pop(context);
              },
              type: BACK,
              showRightIcon: false,
            ),
            SizedBox(
              height: 20,
            ),
            ItemView.height(
              data,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Faker().lorem.sentences(2).join(),
              style: TextStyle(fontSize: 18, fontFamily: 'OpenSans'),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.favorite_border_rounded,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '9.3k',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.messenger_outline_rounded,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '1.3k',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '\u20b9 3000.00',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  height: 66,
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange[600],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.bookmark_border_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 66,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Buy',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'OpenSans',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
