import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryData {
  String name;
  String image;

  CategoryData(this.name, this.image);
}

class DoctorData {
  String name;
  String image;
  String position;
  int star;

  DoctorData(this.name, this.image, this.position, this.star);
}

class DoctorConsultantUI extends StatefulWidget {
  @override
  _DoctorConsultantUIState createState() => _DoctorConsultantUIState();
}

class _DoctorConsultantUIState extends State<DoctorConsultantUI> {
  final categories = [
    CategoryData('Stress', 'assets/images/001/stress.png'),
    CategoryData('Addiction', 'assets/images/001/addiction.png'),
    CategoryData('Burning', 'assets/images/001/burning.png'),
  ];

  final doctors = [
    DoctorData('Dr. Gary Hawkins', 'assets/images/001/doctor01.png',
        'Sr. Psychologist', 4),
    DoctorData('Dr. Eric Gardener', 'assets/images/001/doctor02.png',
        'Sr. Gestrologist', 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(56),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(56),
          child: BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favourite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile'),
          ]),
        ),
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: BuildAppBar(),
            ),
            Column(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey[200], width: 0.5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[100],
                            blurRadius: 10,
                            offset: Offset(4, 0))
                      ]),
                  child: Center(
                    child: Image.asset(
                      'assets/images/002/google.png',
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Online Doctor \nConsultant',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 60,
                child: CupertinoSearchTextField(
                  placeholder: 'Search',
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Choose Category',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, i) => CategoryView(categories[i], i),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Top Rated Doctors',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: doctors.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, i) => DoctorView(doctors[i]),
            ),
          ],
        ),
      ),
    );
  }
}

Widget DoctorView(DoctorData data) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 10,
      left: 10,
      right: 10,
    ),
    height: 80,
    decoration: BoxDecoration(
        color: Color.fromRGBO(244, 248, 251, 1),
        borderRadius: BorderRadius.circular(20)),
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          data.image,
          width: 70,
          height: 70,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  data.position,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          height: 30,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (c, i) => i + 1 <= data.star
                ? Icon(
                    Icons.star,
                    color: Colors.yellow[600],
                    size: 20,
                  )
                : Icon(
                    Icons.star_border,
                    size: 20,
                    color: Colors.grey,
                  ),
          ),
        ),
      ],
    ),
  );
}

Widget CategoryView(CategoryData data, int position) {
  return Container(
    margin: EdgeInsets.only(
        left: position == 0 ? 20 : 10, right: 10, bottom: 10, top: 10),
    padding: EdgeInsets.all(10),
    height: 180,
    width: 140,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: Colors.grey[200], offset: Offset(2, 2), spreadRadius: 2),
      ],
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          data.image,
          height: 130,
        ),
        Text(
          data.name,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
Widget BuildAppBar() {
  return SizedBox(
    height: 56,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.menu,
          size: 30,
        ),
        Image.asset(
          'assets/images/001/user.png',
          width: 56,
        )
      ],
    ),
  );
}
