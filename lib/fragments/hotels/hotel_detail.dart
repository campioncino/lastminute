import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lm_flutter/model/hotel.dart';
import 'package:lm_flutter/ui/lm_colors.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return SingleChildScrollView(
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
                aspectRatio: 1.5,
                autoPlay: true,
                enlargeCenterPage: false,
                pauseAutoPlayOnTouch: Duration(seconds: 3),
                items: map<Widget>(
                  _hotel.images,
                  (index, i) {
                    return new ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      child: new CachedNetworkImage(
                        imageUrl: i,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
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
            HotelUIWidget.contactUsRow(
              call(_hotel.contact.phoneNumber, FontAwesomeIcons.phone, false),
              call(_hotel.contact.email, FontAwesomeIcons.envelope, true),
            ),
          ],
        ),
      ),
    );
  }

  Widget call(String url, IconData ico, bool mail) {
    return GestureDetector(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Icon(
            ico,
            size: 20,
            color: Colors.black38,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            url,
            textScaleFactor: 0.9,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ]),
        onTap: () => _makeCall(mail ? 'mailto:$url' : 'tel:$url'));
  }

  Future<void> _makeCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
