import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lm_flutter/model/hotel.dart';
import 'package:lm_flutter/model/rest_error.dart';
import 'package:lm_flutter/model/ws_response.dart';

class HotelRestService {
  BuildContext context;

  static HotelRestService _instance;

  factory HotelRestService(context) =>
      _instance ?? HotelRestService.internal(context);

  HotelRestService.internal(this.context);

  static const GET_ALL_HOTELS =
      "https://services.lastminute.com/mobile/stubs/hotels";

  Future<WSResponse> getAllHotels() async {
    WSResponse result = new WSResponse();
    Dio dio = new Dio();
    try {
      dio.options.contentType = ContentType.parse("application/json");
      dio.options.responseType = ResponseType.json;
      Response response = await dio.get(GET_ALL_HOTELS);
      result.data.addAll(parseList(response.data));
      result.success = true;
    } on DioError catch (e) {
      Map tmpErr = json.decode(e.response.data);
      result.error = RestError.fromJson(tmpErr);
      result.success = false;
    }
    return result;
  }

  List<Hotel> parseList(dynamic responseBody) {
    List<Hotel> hotels;
    Map<String, dynamic> map = jsonDecode(responseBody);
    if (map['hotels'] != null) {
      hotels = new List<Hotel>();
      map['hotels'].forEach((v) {
        hotels.add(new Hotel.fromJson(v));
      });
    }
    return hotels;
  }
}
