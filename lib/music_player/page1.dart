import 'package:flutter/material.dart';
import './data/songs.dart';

Songs _songs = Songs();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: MyContent()),
    );
  }
}

class MyContent extends StatefulWidget {
  @override
  _MyContentState createState() => _MyContentState();
}

class _MyContentState extends State<MyContent>
    with SingleTickerProviderStateMixin {
  bool _isPlaying = false;
  bool _btnSheetVisible = false;
  AnimationController _animationController;
  var btmSheet;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            ClipRRect(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(50.0)),
              child: Container(
                height: 350.0,
                foregroundDecoration: BoxDecoration(
                  //color: Colors.orange[700],
                  color: Color.fromRGBO(134, 79, 73, 1),
                  backgroundBlendMode: BlendMode.softLight,
                ),
                decoration: BoxDecoration(
                  //backgroundBlendMode: BlendMode.softLight,
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/free-gaana-bb7d7.appspot.com/o/justin_back.png?alt=media',
                      ),
                      fit: BoxFit.scaleDown),
                  color: Colors.red[900],
                  //color: Color.fromRGBO(134, 79, 73, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  child: Stack(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: () => _btnSheetVisible
                                ? Navigator.pop(context)
                                : print('open drawer'),
                            child: _btnSheetVisible
                                ? Icon(
                                    Icons.arrow_back,
                                    size: 30.0,
                                    color: Colors.white,
                                  )
                                : Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/free-gaana-bb7d7.appspot.com/o/menu_1.png?alt=media',
                                    height: 30,
                                  ),
                          ),
                          IconButton(
                            onPressed: () => print('open info'),
                            icon: Icon(
                              Icons.info_outline,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 150,
                        child: Container(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Trending',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Justin \nBieber',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 60.0,
                                  height: 0.8,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Popular',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () => print('show all'),
                    child: Text(
                      'Show all',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.orange[400]),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                        /*onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NowPlaying()),
                        ),*/
                        onTap: () => {
                          btmSheet = showBottomSheet(
                            context: context,
                            builder: (context) => _NowPlaying(
                                _songs.songs[index],
                                MediaQuery.of(context).size.height / 1.2),
                            backgroundColor: Colors.transparent,
                          ),
                          setState(() {
                            _btnSheetVisible = !_btnSheetVisible;
                          }),
                          btmSheet.closed.then((value) => setState(
                              () => _btnSheetVisible = !_btnSheetVisible))
                        },
                        child: Container(
                          height: 50.0,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  _songs.songs[index].name,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Text(
                                _songs.songs[index].duration,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                Icons.more_horiz,
                                size: 24,
                                color: Colors.grey[300],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 3.0,
                      );
                    },
                    itemCount: _songs.songs.length),
              ),
            )
          ],
        ),
        Positioned(
          top: 325.0,
          right: 40.0,
          child: Transform.scale(
            scale: 1.2,
            child: FloatingActionButton(
                elevation: 10.0,
                onPressed: () {
                  setState(() {
                    _isPlaying
                        ? _animationController.reverse()
                        : _animationController.forward();
                    _isPlaying = !_isPlaying;
                  });
                },
                backgroundColor: Colors.orange,
                child: AnimatedIcon(
                  icon: AnimatedIcons.play_pause,
                  progress: _animationController,
                  size: 30.0,
                )),
          ),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class _NowPlaying extends StatefulWidget {
  Song song;
  double _height;
  _NowPlaying(this.song, this._height);

  @override
  __NowPlayingState createState() => __NowPlayingState();
}

class __NowPlayingState extends State<_NowPlaying>
    with SingleTickerProviderStateMixin {
  Song get song => widget.song;
  double get height => widget._height;

  double _progressValue = 0.0;
  double _volumeState = 0.0;
  AnimationController _playPauseController;
  bool _isPlaying = false;
  int forFirst = 0;

  @override
  void initState() {
    _playPauseController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _playPauseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          //height: MediaQuery.of(context).size.height / 1.2,
          //height: 500.0,
          width: double.infinity,
          //color: Colors.white,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  height: 200.0,
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/free-gaana-bb7d7.appspot.com/o/justin_small.png?alt=media',
                    //height: 250.0,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Slider.adaptive(
                  max: 100.0,
                  min: 0.0,
                  divisions: 100,
                  value: _progressValue,
                  activeColor: Colors.orange,
                  inactiveColor: Colors.grey,
                  //label: '${_progressValue.round()}',
                  onChanged: (newValue) => setState(() {
                    _progressValue = newValue;
                  }),
                  semanticFormatterCallback: (newValue) {
                    return '${newValue.round()}';
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('${_progressValue.round()}'),
                      Text(song.duration)
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  song.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  song.artist,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.orange,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 70.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        enableFeedback: true,
                        onPressed: () => print('fast rewind'),
                        icon: Icon(
                          Icons.fast_rewind,
                          color: Colors.grey[700],
                          size: 30.0,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _isPlaying
                              ? forFirst == 0
                                  ? _playPauseController.forward()
                                  : _playPauseController.reverse()
                              : _playPauseController.forward();
                          setState(() {
                            _isPlaying = !_isPlaying;
                            forFirst++;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            //color: Colors.grey,
                            border: Border.all(
                                color: Colors.grey[700],
                                style: BorderStyle.solid,
                                width: 1.5),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          height: 60.0,
                          width: 60.0,
                          child: Center(
                            child: AnimatedIcon(
                              icon: AnimatedIcons.play_pause,
                              size: 40.0,
                              color: Colors.grey[700],
                              progress: _playPauseController,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        enableFeedback: true,
                        onPressed: () => print('fast forward'),
                        icon: Icon(
                          Icons.fast_forward,
                          color: Colors.grey[700],
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.volume_mute,
                      size: 18.0,
                      color: Colors.grey[300],
                    ),
                    Expanded(
                      child: Slider.adaptive(
                        max: 100.0,
                        min: 0.0,
                        divisions: 100,
                        value: _volumeState,
                        activeColor: Colors.grey[500],
                        inactiveColor: Colors.grey[300],
                        //label: '${_progressValue.round()}',
                        onChanged: (newValue) => setState(() {
                          _volumeState = newValue;
                        }),
                        semanticFormatterCallback: (newValue) {
                          return '${_volumeState.round()}';
                        },
                      ),
                    ),
                    Icon(
                      Icons.volume_up,
                      size: 18.0,
                      color: Colors.grey[300],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
