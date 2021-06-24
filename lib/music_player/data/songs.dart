class Songs {
  List<Song> songs = [
    Song('Yummy', '5:20', 'Justin Beiber'),
    Song('Intention', '4:21', 'Justin Beiber'),
    Song('Changes', '2:04', 'Justin Beiber'),
    Song('Where are you now', '3:49', 'Justin Beiber'),
    Song('Some Song', '5:00', 'Justin Beiber'),
    Song('yet another song', '3:29', 'Justin Beiber'),
    Song('what', '4:50', 'Justin Beiber'),
    Song('hey !', '3:19', 'Justin Beiber'),
    Song('yooo', '6:01', 'Justin Beiber'),
  ];
}

class Song {
  var _name, _duration, _artist;

  Song(this._name, this._duration, this._artist);

  get artist => _artist;

  get duration => _duration;

  get name => _name;
}
