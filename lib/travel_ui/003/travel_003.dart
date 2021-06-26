import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class TravelUI_003 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/003/splash.png'),
              Column(
                children: [
                  Text(
                    'Travel with ease.',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    faker.lorem.sentences(3).join(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(71, 166, 159, 1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(71, 166, 159, 1),
                          offset: Offset(2, 8),
                          blurRadius: 15,
                        )
                      ]),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
