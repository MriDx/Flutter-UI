class FeaturedHotel {
  List<HotelRoom> hotelRooms = [
    HotelRoom(
        'https://q-cf.bstatic.com/images/hotel/max1024x768/124/124033028.jpg',
        false,
        'Luxorious King-Size Bedroom',
        '4.5',
        '1200/night'),
    HotelRoom('https://cdn.blueswandaily.com//2019/12/hotelroom-2000x1200.jpg',
        false, 'Luxorious King-Size Bedroom', '4.5', '1200/night'),
    HotelRoom(
        'https://media-cdn.tripadvisor.com/media/photo-s/11/d4/ae/90/the-chi-boutique-hotel.jpg',
        false,
        'Permium Room for IT Professionals',
        '4.7',
        '1500/night'),
    HotelRoom(
        'https://themalaysianreserve.com/wp-content/uploads/2020/03/TMRAK1011_07-HOTEL.jpg',
        true,
        'Bedroom',
        '4.3',
        '1000/night'),
    HotelRoom(
        'https://pix10.agoda.net/hotelImages/160/1601291/1601291_17062916290054159438.jpg?s=1024x768',
        false,
        'King-Size Bedroom',
        '3.9',
        '2200/night'),
    HotelRoom(
        'https://www.gingerhotels.com/resourcefiles/roomssnippetimages/ginger-ahemedabad-standard-twin-room.jpg',
        false,
        'Dual-Bed Bedroom',
        '4.8',
        '1700/night'),
  ];

  void setFav(int index, bool fav) {
    hotelRooms[index].favorite = fav;
  }
}

class HotelRoom {
  String _image;
  bool _favorite;
  String _name, _ratings, _rate;

  HotelRoom(this._image, this._favorite, this._name, this._ratings, this._rate);

  set image(String value) {
    _image = value;
  }

  set favorite(bool value) {
    _favorite = value;
  }

  bool get favorite => _favorite;

  String get image => _image;

  get rate => _rate;

  set rate(value) {
    _rate = value;
  }

  get ratings => _ratings;

  set ratings(value) {
    _ratings = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
