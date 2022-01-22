import 'dart:developer';

import 'package:live_climate/model/get_location_permission.dart';
import 'package:live_climate/model/network.dart';

class GetWeatherData {
  final String apiKey = "bc9e28dea3bb2d06e191d364c1b12239";

  Future<dynamic> getCityWeatherData(String cityName) async {
    try {
      String apiUrl =
          "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";
      NetworkUtil networkUtil = NetworkUtil(url: apiUrl);
      var jsonResponse = await networkUtil.getData();
      // log(jsonResponse.toString());
      return jsonResponse;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<dynamic> getWeatherData(GetLocation location) async {
    try {
      // String apiKey = "6528556ef2703df0533eaa821c258160";
      String apiUrl =
          "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric";
      NetworkUtil networkUtil = NetworkUtil(url: apiUrl);
      var jsonResponse = await networkUtil.getData();
      // log(jsonResponse.toString());
      return jsonResponse;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
