import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobFinderUI01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
              left: Platform.isIOS ? 0 : 20,
              right: Platform.isIOS ? 0 : 20,
              bottom: Platform.isIOS ? 0 : 10),
          decoration: BoxDecoration(
            borderRadius: Platform.isIOS
                ? BorderRadius.only(
                    topLeft: Radius.circular(56),
                    topRight: Radius.circular(56),
                  )
                : BorderRadius.circular(56),
            color: Colors.black,
          ),
          child: ClipRRect(
            borderRadius: Platform.isIOS
                ? BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
                : BorderRadius.circular(56),
            child: BottomNavigationBar(
              backgroundColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              elevation: 10,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.orange,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_border), label: 'Saved'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.mail_outline_rounded), label: 'Chat'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline), label: 'Profile'),
              ],
            ),
          ),
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: BuildAppBar(),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(child: Content()),
          ],
        ),
      ),
    );
  }
}

Widget BuildAppBar() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset('assets/images/002/user.png')),
      SizedBox(
        width: 15,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              'Welcome',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[500]),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Lucas Angelo',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[300]),
            ),
          ],
        ),
      ),
      Icon(
        Icons.notifications_none,
        size: 30,
        color: Colors.grey[500],
      ),
    ],
  );
}

class JobData {
  String jobRole;
  String companyName;
  String address;
  String postedAt;
  String logo;

  JobData(
      this.jobRole, this.companyName, this.address, this.postedAt, this.logo);
}

class Content extends StatelessWidget {
  //const Content({Key? key}) : super(key: key);

  final jobList = [
    JobData('Software Engineer', 'Google', 'California, US', '3h',
        'assets/images/002/google.png'),
    JobData('Product Designer', 'Airbnb', 'London, UK', '12h',
        'assets/images/002/airbnb.png'),
    JobData('UX Researcher', 'Amazon', 'San fransisco, US', '21h',
        'assets/images/002/amazon.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 30, right: 30, top: 30),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Find your dream \njob',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SearchView(),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: jobList.length,
              itemBuilder: (c, i) => JobView(
                jobList[i],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget JobView(JobData data) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 20,
    ),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[50],
          spreadRadius: 5,
          offset: Offset(4, 4),
        )
      ],
    ),
    child: Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey[200], width: 0.5),
              color: Colors.white),
          child: Center(
            child: Image.asset(
              data.logo,
              width: 50,
              height: 50,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.jobRole,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    data.companyName,
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.grey[400]),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.location_on,
                    size: 15,
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    data.address,
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.grey[400]),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.postedAt,
                    style: TextStyle(
                        color: Colors.grey[400], fontWeight: FontWeight.w600),
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Icon(
                        Icons.share,
                        size: 20,
                        color: Colors.grey[400],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.bookmark_border,
                        size: 20,
                        color: Colors.grey[400],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget SearchView() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: SizedBox(
          height: 56,
          child: CupertinoSearchTextField(
            borderRadius: BorderRadius.circular(56),
            placeholder: 'Search',
            itemSize: 30,
          ),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          'assets/images/002/filter.png',
          height: 56,
          width: 56,
          fit: BoxFit.fill,
        ),
      ),
    ],
  );
}
