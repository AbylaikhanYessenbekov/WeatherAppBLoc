import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/weather.dart';



class ApiProvider {
  Future<dynamic> request(String city) async {
    print(city);
    try {
      final response = await http.get(
        Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=$city&appid=b78ae4b705425a396354722cc463dd0f'),
      );
      final weather = weatherFromJson(response.body);
      return weather;
    } catch (e) {
      log(e.toString());
      return e;
    }
  }



}