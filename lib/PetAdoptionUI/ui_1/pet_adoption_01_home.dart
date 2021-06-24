import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/PetAdoptionUI/PetAdoptionUI.dart';
import 'package:ui/PetAdoptionUI/ui_1/pet_adoption_01_pet_details.dart';

class PetType {
  final String name;
  bool selected;

  PetType(this.name, this.selected);
}

class PetAdoption01Home extends StatefulWidget {
  @override
  _PetAdoption01HomeState createState() => _PetAdoption01HomeState();
}

class _PetAdoption01HomeState extends State<PetAdoption01Home> {
  final petTypes = [
    PetType('Cats', false),
    PetType('Dogs', false),
    PetType('Fishes', false),
    PetType('Others', false),
  ];

  var selectedType = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Search friend',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 60,
                    child: CupertinoSearchTextField(
                      backgroundColor: Colors.grey[100],
                      borderRadius: BorderRadius.circular(50),
                      placeholder: 'Search...',
                      placeholderStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[500],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 70,
                    child: Row(
                      children: [
                        Icon(
                          Icons.filter_list,
                          size: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: petTypes.length,
                            itemBuilder: (context, i) {
                              var petType = petTypes[i];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedType = i;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 5, right: 5),
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: i == selectedType
                                        ? Colors.black
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(70),
                                    border: Border.all(
                                        color: Colors.grey[300], width: 0.5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      petType.name,
                                      style: TextStyle(
                                        color: i == selectedType
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Adopt me',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int realIndex) =>
                          InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetAdoption01PetDetails()));
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40)),
                      child: Image.asset(
                        'assets/images/pet_02.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    aspectRatio: 9 / 16,
                    viewportFraction: 0.6,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
