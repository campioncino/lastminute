import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lm_flutter/model/hotel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lm_flutter/ui/lm_colors.dart';

import 'hotel_ui_widget.dart';

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class HotelDetail extends StatefulWidget {
  final Hotel hotel;

  const HotelDetail({@required this.hotel});

  @override
  _HotelDetailState createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  Hotel _hotel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _hotel = this.widget.hotel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(
          "Hotel Details",
          style: new TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pinkAccent,
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      body: _contentWidget(),
      resizeToAvoidBottomPadding: true,
    );
  }

  @override
  void didUpdateWidget(HotelDetail oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  Widget _contentWidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                    child: HotelUIWidget.rowTitle(_hotel,
                        color: LmColors.BASE, weight: FontWeight.bold)),
                SizedBox(
                  width: 8,
                ),
                HotelUIWidget.stars(_hotel)
              ],
            ),
            HotelUIWidget.addressRow(_hotel),
            SizedBox(
              height: 10,
            ),
            CarouselSlider(
                viewportFraction: 1.0,
                aspectRatio: 2.0,
                autoPlay: true,
                enlargeCenterPage: false,
                pauseAutoPlayOnTouch: Duration(seconds: 3),
                items: map<Widget>(
                  _hotel.images,
                  (index, i) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                i ?? Icon(FontAwesomeIcons.camera)),
                            fit: BoxFit.cover),
                      ),
                    );
                  },
                )),
            SizedBox(
              height: 10,
            ),
            HotelUIWidget.userRatingRow(_hotel),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                HotelUIWidget.checkIn(_hotel),
                Icon(
                  FontAwesomeIcons.calendarAlt,
                  size: 40,
                  color: Colors.black38,
                ),
                HotelUIWidget.checkOut(_hotel)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            HotelUIWidget.contactUsRow(_hotel)
          ],
        ),
      ),
    );
  }
}
