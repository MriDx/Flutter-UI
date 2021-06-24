import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui/hotel/ui/room_view.dart';
import '../data/featured_hotel.dart';

FeaturedHotel featuredHotel = FeaturedHotel();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: HomeContent(),
      theme: ThemeData(bottomAppBarColor: Colors.yellowAccent),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContent createState() => _HomeContent();
}

class _HomeContent extends State<HomeContent> {
  int _currentIndex = 0;

  List<dynamic> _contents = [
    _MainContent(),
    Container(
      color: Colors.teal,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.yellow,
    ),
  ];

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Sure to exit'),
            content: Text('Ha oi'),
            actions: <Widget>[
              InkWell(
                onTap: () => print('baal nki'),
                child: Text('Ok'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop(false);
        return Future(() => false);
      },
      //onWillPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: _contents[_currentIndex],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey[400],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 20.0,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard,
                  size: 30.0,
                ),
                title: Text(''),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                  size: 30.0,
                ),
                activeIcon: Icon(
                  Icons.favorite,
                  size: 30.0,
                ),
                title: Text(''),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.business_center,
                  size: 30.0,
                ),
                activeIcon: Icon(
                  Icons.business_center,
                  size: 30.0,
                ),
                title: Text(''),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  size: 30.0,
                ),
                activeIcon: Icon(
                  Icons.account_circle,
                  size: 30.0,
                ),
                title: Text(''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MainContent extends StatefulWidget {
  @override
  __MainContentState createState() => __MainContentState();
}

class __MainContentState extends State<_MainContent> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            _CustomAppBar(),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'Find Your Room',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                height: 2,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            _CustomSearchWithFilter(),
            SizedBox(
              height: 30.0,
            ),
            // _RoomViewCard(),
            Container(
              height: ((MediaQuery.of(context).size.width / 2) - 30) * 1.7,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RoomView())),
                    child: _RoomViewCard(index, size.width / 2 - 30,
                        ((size.width / 2.0) - 40.0) * 1.4, true),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 10.0,
                  );
                },
                itemCount: featuredHotel.hotelRooms.length,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Sort By',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _SortIcon(
                    Color.fromRGBO(216, 252, 241, 1),
                    Icon(
                      Icons.restaurant,
                      color: Color.fromRGBO(74, 166, 117, 1),
                      size: 30.0,
                    ),
                    'Resto'),
                _SortIcon(
                    Color.fromRGBO(254, 243, 217, 1),
                    Center(
                      child: SvgPicture.network(
                        'https://firebasestorage.googleapis.com/v0/b/free-gaana-bb7d7.appspot.com/o/iconfinder_cafe_103270.svg?alt=media',
                        color: Color.fromRGBO(120, 87, 28, 1),
                        width: 30,
                        height: 30,
                      ),
                    ),
                    'Cafe'),
                _SortIcon(
                    Color.fromRGBO(249, 217, 235, 1),
                    Center(
                      child: SvgPicture.network(
                        'https://firebasestorage.googleapis.com/v0/b/free-gaana-bb7d7.appspot.com/o/wine-glass.svg?alt=media',
                        color: Color.fromRGBO(169, 89, 90, 1),
                        height: 24,
                        width: 24,
                      ),
                    ),
                    'Bar'),
                _SortIcon(
                    Color.fromRGBO(218, 237, 253, 1),
                    Center(
                      child: SvgPicture.network(
                        'https://firebasestorage.googleapis.com/v0/b/free-gaana-bb7d7.appspot.com/o/more.svg?alt=media',
                        width: 24,
                        height: 24,
                        color: Color.fromRGBO(63, 140, 208, 1),
                      ),
                    ),
                    'More'),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Best Price',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: ((size.width / 3) - 30) * 1.7,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemBuilder: (context, index) {
                  return _RoomViewCard(index, size.width / 3 - 30,
                      ((size.width / 3) - 30.0) * 1.2, false);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 10.0,
                  );
                },
                itemCount: featuredHotel.hotelRooms.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class _SortIcon extends StatelessWidget {
  Color color;
  Widget child;
  String text;
  _SortIcon(this.color, this.child, this.text);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            height: 60.0,
            width: 60.0,
            color: color,
            child: child,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}

class _CustomSearchWithFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              height: 48.0,
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      CupertinoIcons.search,
                      size: 30.0,
                      color: Colors.black45,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                        ),
                        autofocus: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: InkWell(
            onTap: () => print('filter'),
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Container(
              width: 48.0,
              height: 48.0,
              color: Colors.green,
              /*child: IconButton(
                onPressed: () => print('filter'),
                icon: Icon(
                  Icons.filter_list,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),*/
              child: Center(
                child: Transform.rotate(
                  angle: 14.1,
                  child: SvgPicture.network(
                    'https://firebasestorage.googleapis.com/v0/b/free-gaana-bb7d7.appspot.com/o/tune-24px.svg?alt=media',
                    color: Colors.white,
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomAppBar extends StatefulWidget {
  @override
  __CustomAppBarState createState() => __CustomAppBarState();
}

class __CustomAppBarState extends State<_CustomAppBar>
    with SingleTickerProviderStateMixin {
  //AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    /*_animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);*/
  }

  @override
  void dispose() {
    //_animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          onPressed: () => print('open menu'),
          icon: Icon(
            Icons.sort,
            size: 30.0,
          ),
          /*icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: _animationController,
          ),*/
          padding: EdgeInsets.all(0.0),
        ),
        IconButton(
          onPressed: () => print('Hello'),
          icon: Icon(
            Icons.notifications_none,
            size: 30.0,
          ),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class _RoomViewCard extends StatefulWidget {
  int _index;
  double _width;
  double _height;
  bool _showFav;

  _RoomViewCard(this._index, this._width, this._height, this._showFav);

  //int get index => _index;

  @override
  __RoomViewCardState createState() => __RoomViewCardState();
}

class __RoomViewCardState extends State<_RoomViewCard> {
  int get index => widget._index;
  double get width => widget._width;
  double get height => widget._height;
  bool get showFav => widget._showFav;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    bool _fav = featuredHotel.hotelRooms[index].favorite;
    return Container(
      width: width,
      //width: _size.width / 2 - 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              //width: (_size.width / 2.0),
              //height: ((_size.width / 2.0) - 40.0) * 1.4,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey[200],
                image: DecorationImage(
                    image: NetworkImage(
                      featuredHotel.hotelRooms[widget._index].image,
                    ),
                    fit: BoxFit.cover),
              ),
              child: showFav
                  ? Row(
                      verticalDirection: VerticalDirection.down,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            //topRight: Radius.circular(20.0),
                          ),
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            color: Colors.white,
                            child: IconButton(
                              padding: EdgeInsets.all(0.0),
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              enableFeedback: false,
                              onPressed: () {
                                setState(() {
                                  _fav = !_fav;
                                  featuredHotel.setFav(index, _fav);
                                });
                              },
                              icon: Icon(
                                _fav ? Icons.favorite : Icons.favorite_border,
                                size: _fav ? 30.0 : 24.0,
                                color: _fav ? Colors.red[800] : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: showFav
                ? Text(
                    featuredHotel.hotelRooms[index].name.toString(),
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  )
                : null,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0, left: 5.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  '\u20B9 ${featuredHotel.hotelRooms[index].rate.toString()}',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Colors.grey[700]),
                )),
                ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                size: 10.0,
                                color: Colors.orange[500],
                              ),
                              Text(
                                featuredHotel.hotelRooms[index].ratings
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
