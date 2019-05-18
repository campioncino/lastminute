import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lm_flutter/model/hotel.dart';
import 'package:lm_flutter/ui/lm_colors.dart';

class HotelUIWidget {
  static Widget rowItem(Hotel hotel) {
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HotelUIWidget.rowTitle(hotel),
                new Container(
                  height: 5.0,
                ),
                HotelUIWidget.rowStarsAndRating(hotel),
                new Container(
                  height: 5.0,
                ),
                HotelUIWidget.city(hotel),
                new Container(
                  height: 5.0,
                ),
              ],
            ),
          )
        ]);
  }

  static Widget rowTitle(Hotel item, {Color color, FontWeight weight}) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Flexible(
            child: new Text("${item.name}",
                maxLines: 2,
                textScaleFactor: 1.3,
                style: new TextStyle(
                  fontWeight: weight ?? FontWeight.normal,
                  fontStyle: FontStyle.italic,
                  color: color ?? Colors.lightBlue,
                ))),
      ],
    );
  }

  static Widget rowStarsAndRating(Hotel item) {
    return new Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          stars(item),
          Row(children: <Widget>[
            Text(
              "Rating ",
              textScaleFactor: 0.9,
            ),
            new Text(item.userRating.toString(),
                textScaleFactor: 0.9,
                style: new TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87))
          ])
        ],
      ),
    );
  }

  static Widget stars(Hotel item) {
    var starWidgets = List<Widget>();
    for (int i = 0; i < item.stars; i++) {
      starWidgets.add(Padding(
        padding: const EdgeInsets.all(1.0),
        child: Icon(
          FontAwesomeIcons.solidStar,
          size: 15,
          color: Colors.amberAccent,
        ),
      )); // TODO: Whatever layout you need for each widget.
    }

    return new Row(children: starWidgets);
  }

  static Widget city(Hotel item) {
    return Column(
      children: <Widget>[
        new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Flexible(
                child: new Text(item.location.city,
                    maxLines: 2,
                    textScaleFactor: 1,
                    style: new TextStyle(
                      fontStyle: FontStyle.italic,
                    ))),
          ],
        ),
        new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Flexible(
                child: new Text(item.location.address,
                    maxLines: 2,
                    textScaleFactor: 0.8,
                    style: new TextStyle(fontStyle: FontStyle.italic)))
          ],
        )
      ],
    );
  }

  static Widget checkIn(
    Hotel item,
  ) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
              color: Colors.lightBlue,
              child: new Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("CHECK IN",
                    maxLines: 2,
                    softWrap: true,
                    textScaleFactor: 1.1,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    )),
              )),
          SizedBox(
            width: 5.0,
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Text("from "),
                  Text(
                    item.checkIn.from,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  Text("to "),
                  Text(item.checkIn.to,
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  static Widget checkOut(
    Hotel item,
  ) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
              color: Colors.lightBlue,
              child: new Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("CHECK OUT",
                    maxLines: 2,
                    softWrap: true,
                    textScaleFactor: 1.1,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    )),
              )),
          SizedBox(
            width: 5.0,
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Text("from "),
                  Text(
                    item.checkOut.from,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  Text("to "),
                  Text(item.checkOut.to,
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  static Widget userRatingRow(Hotel hotel) {
    String humanValue;
    Color col;
    if (hotel.userRating <= 7.4) {
      humanValue = "AVERAGE";
      col = LmColors.AVERAGE;
    } else if (hotel.userRating > 7.4 && hotel.userRating <= 8) {
      humanValue = "GOOD";
      col = LmColors.GOOD;
    } else if (hotel.userRating > 8 && hotel.userRating < 8.7) {
      humanValue = "GREAT";
      col = LmColors.GREAT;
    } else {
      humanValue = "EXCELLENT";
      col = LmColors.EXCELLENT;
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "User Rating",
            textScaleFactor: 1.1,
          ),
          Spacer(),
          Text(
            humanValue,
            style: TextStyle(fontWeight: FontWeight.bold, color: col),
          ),
          SizedBox(
            width: 5,
          ),
          CircleAvatar(
            backgroundColor: col,
            child: Text(
              hotel.userRating.toString(),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ]);
  }

  static Widget addressRow(Hotel hotel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.mapMarkerAlt,
          size: 35,
          color: Colors.blueGrey[400],
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              hotel.location.city,
              textScaleFactor: 1.1,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              hotel.location.address,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            Text(
              "${hotel.location.latitude},${hotel.location.longitude}",
              textScaleFactor: 0.6,
            )
          ],
        )
      ],
    );
  }

  static Widget contactUsRow(Hotel hotel) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: LmColors.BASE_ACCENT)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text("HOTEL CONTACTS"),
            SizedBox(
              height: 7,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Icon(
                FontAwesomeIcons.phone,
                size: 20,
                color: Colors.black38,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                hotel.contact.phoneNumber,
                textScaleFactor: 0.9,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ]),
            SizedBox(
              height: 7,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Icon(
                FontAwesomeIcons.envelope,
                size: 20,
                color: Colors.black38,
              ),
              SizedBox(
                width: 10,
              ),
              Text(hotel.contact.email)
            ])
          ],
        ),
      ),
    );
  }
}
