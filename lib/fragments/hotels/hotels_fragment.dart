import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lm_flutter/fragments/hotels/hotel_ui_widget.dart';
import 'package:lm_flutter/model/hotel.dart';
import 'package:lm_flutter/model/ws_response.dart';
import 'package:lm_flutter/rest/hotel_rest_service.dart';
import 'package:lm_flutter/ui/lm_colors.dart';
import 'package:lm_flutter/utils/app_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'hotel_detail.dart';

class HotelsFragment extends StatefulWidget {
  const HotelsFragment();

  @override
  _HotelsFragmentState createState() => new _HotelsFragmentState();
}

class _HotelsFragmentState extends State<HotelsFragment> {
  ScrollController _scrollController = new ScrollController();

  List<Hotel> _values = new List();
  List<Hotel> _original = new List();
  int _orderByUserRating = 0;
  int _orderByHotelStars = 0;

  bool isPerformingRequest = false;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _search();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<List<Hotel>> _search() async {
    if (await AppUtils.isOffline()) {
      AppUtils.snackbarOfflineByScaffoldKey(_scaffoldKey);
      return null;
    }

    _values.clear();
    _original.clear();
    _orderByUserRating = 0;
    _orderByHotelStars = 0;
    if (!isPerformingRequest) {
      setState(() {
        isPerformingRequest = true;
      });
    }
    WSResponse tmp = await HotelRestService.internal(context).getAllHotels();

    if (tmp.success) {
      List<Hotel> hotels = tmp.data.cast<Hotel>();
      setState(() {
        if (tmp != null) {
          _values.addAll(hotels);
          _original.addAll(hotels);
        }
        isPerformingRequest = false;
      });
    }
    return _values;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _search,
          child: new Column(
            children: <Widget>[
              new SingleChildScrollView(
                child: sortingButtons(),
                scrollDirection: Axis.horizontal,
              ),
              new Expanded(child: Center(child: createList(context))),
            ],
          )),
    );
  }

  Widget createList(BuildContext context) {
    if (isPerformingRequest) {
      return CircularProgressIndicator();
    }
    if (_values.isEmpty) {
      return _emptyBody();
    } else {
      return new ListView.builder(
          controller: _scrollController,
          itemCount: _values.length,
          itemBuilder: (context, item) {
            return _buildChildRow(_values[item]);
          });
    }
  }

  Widget _buildChildRow(Hotel hotel) {
    return InkWell(
        onTap: () => _onTapItem(context, hotel),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  sizedContainer(new CachedNetworkImage(
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    imageUrl: hotel.images.first,
                    errorWidget: (context, url, error) =>
                        new Icon(FontAwesomeIcons.camera),
                  )),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(child: HotelUIWidget.rowItem(hotel)),
                ]),
          ),
        ));
  }

  void _onTapItem(BuildContext context, Hotel hotel) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HotelDetail(hotel: hotel),
        ));
  }

  Widget _emptyBody() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            FontAwesomeIcons.receipt,
            size: 50.0,
            color: Colors.grey[300],
          ),
          new SizedBox(height: 20.0),
          new Text(
            'Empty',
            style: new TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget sizedContainer(Widget child) {
    return new SizedBox(
      width: 100.0,
      height: 100.0,
      child: new Center(
        child: child,
      ),
    );
  }

  _sortByUserRating(int value) {
    List<Hotel> tmp = _values;
    tmp.sort((a, b) {
      return b.userRating.compareTo(a.userRating);
    });

    switch (value % 3) {
      case 0:
        _values = _original;
        break;
      case 1:
        _values = tmp;
        break;
      case 2:
        _values = tmp.reversed.toList();
        break;
    }
  }

  _sortByHotelStars(int value) {
    List<Hotel> tmp = _values;
    tmp.sort((a, b) {
      return b.stars.compareTo(a.stars);
    });
    switch (value % 3) {
      case 0:
        _values = _original;
        break;
      case 1:
        _values = tmp;
        break;
      case 2:
        _values = tmp.reversed.toList();
        break;
    }
  }

  iconUpDown(int value, IconData iconUp, IconData iconDown, {Color col}) {
    int tot = value % 3;
    if (tot == 1) {
      return Icon(iconUp, color: col ?? Colors.black54, size: 22);
    } else if (tot == 2) {
      return Icon(iconDown, color: col ?? Colors.black54, size: 22);
    } else if (tot == 0) {
      return Icon(iconDown, color: Colors.black54, size: 20);
    }
  }

  textUpDown(int value, String text, {Color col}) {
    int tot = value % 3;
    if (tot == 0) {
      col = Colors.black54;
    }
    return new Text(text,
        style: TextStyle(color: col, fontWeight: FontWeight.bold));
  }

  Widget sortingButtons() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new GestureDetector(
          child: new Chip(
            backgroundColor:
                _orderByUserRating % 3 != 0 ? LmColors.CHIP_ACCENT : null,
            avatar: iconUpDown(
                _orderByUserRating,
                FontAwesomeIcons.sortNumericUp,
                FontAwesomeIcons.sortNumericDown,
                col: Colors.white),
            label: textUpDown(_orderByUserRating, "User Rating",
                col: Colors.white),
          ),
          onTap: () {
            setState(() {
              _orderByHotelStars = 0;
              _orderByUserRating += 1;
              _sortByUserRating(_orderByUserRating);
            });
          },
        ),
        SizedBox(
          width: 8.0,
        ),
        new GestureDetector(
          child: new Chip(
            backgroundColor:
                _orderByHotelStars % 3 != 0 ? LmColors.CHIP_ACCENT : null,
            avatar: iconUpDown(_orderByHotelStars,
                FontAwesomeIcons.sortAmountDown, FontAwesomeIcons.sortAmountUp,
                col: Colors.white),
            label: textUpDown(_orderByHotelStars, "Hotel Stars",
                col: Colors.white),
          ),
          onTap: () {
            setState(() {
              _orderByHotelStars += 1;
              _orderByUserRating = 0;
              _sortByHotelStars(_orderByHotelStars);
            });
          },
        ),
      ],
    );
  }
}
