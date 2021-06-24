import 'package:flutter/material.dart';

class PetAdoption01PetDetails extends StatefulWidget {
  @override
  _PetAdoption01PetDetailsState createState() =>
      _PetAdoption01PetDetailsState();
}

class _PetAdoption01PetDetailsState extends State<PetAdoption01PetDetails> {
  final iconList = [
    Icon(
      Icons.fastfood,
      size: 30,
    ),
    Icon(
      Icons.medical_services,
      size: 30,
    ),
    Icon(
      Icons.home_outlined,
      size: 30,
    ),
    Icon(
      Icons.pets,
      size: 30,
    ),
  ];

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey[50],
        width: double.infinity,
        child: Column(
          children: [
            Container(
              child: Image.asset(
                'assets/images/pet_03.png',
                height: (MediaQuery.of(context).size.height / 2) - 50,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 30),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        'Welsh Corgi',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: iconList.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = i;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: i == 0 ? 30 : 5, right: 5),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: selectedIndex == i
                                    ? Colors.grey[200]
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(80),
                                border: Border.all(
                                    color: Colors.grey[200], width: 0.5),
                              ),
                              child: Center(
                                child: iconList[i],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        'Any diet should be appropriate to the dog\'s age. Clean, fresh water should be available at all times.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      hoverColor: Colors.grey,
                      splashColor: Colors.grey,
                      focusColor: Colors.grey,
                      onTap: () {},
                      child: Container(
                        height: 60.0,
                        margin: EdgeInsets.only(left: 30, right: 30),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Center(
                          child: Text(
                            'Meet with pet',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
