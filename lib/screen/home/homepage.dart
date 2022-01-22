import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:live_climate/model/get_weather_data.dart';
import 'package:live_climate/screen/location/location_screen.dart';

class HomePage extends StatefulWidget {
  final dynamic weatherData;
  const HomePage({Key? key, this.weatherData}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetWeatherData getWeatherData = GetWeatherData();
  String? cityName, weatherStatus;
  int? temperature, minTemperature, maxTemperature;

  @override
  void initState() {
    super.initState();
    log(widget.weatherData.toString());
    updateWeatherScreen(widget.weatherData);
  }

  updateWeatherScreen(dynamic weatherData) {
    if (weatherData == null) {
      cityName = "City Name";
      temperature = 0;
      minTemperature = 0;
      maxTemperature = 0;
      weatherStatus = "";
    } else {
      cityName = weatherData['name'];
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      double minTemp = weatherData['main']['temp_min'];
      double maxTemp = weatherData['main']['temp_max'];
      minTemperature = minTemp.toInt();
      maxTemperature = maxTemp.toInt();
      weatherStatus = weatherData['weather'][0]['main'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child: Text(cityName!)),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            right: 8,
            left: 16,
            top: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    cityName!,
                    style: const TextStyle(
                      fontSize: 44,
                    ),
                  )),
                  IconButton(
                    onPressed: () async {
                      var cityName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LocationPage()));
                      // log(cityName);
                      if (cityName != null) {
                        var weatherData =
                            await getWeatherData.getCityWeatherData(cityName);
                        setState(() {
                          updateWeatherScreen(weatherData);
                        });
                      }
                    },
                    icon: const Icon(Icons.location_city),
                  ),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    temperature.toString(),
                    style: const TextStyle(
                      fontSize: 120,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      "°C",
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  )
                ],
              ),
              Text(weatherStatus!),
              Row(
                children: [
                  const Icon(
                    Icons.arrow_downward,
                    size: 16,
                  ),
                  Text(minTemperature.toString() + "°C"),
                  const SizedBox(
                    width: 16,
                  ),
                  const Icon(
                    Icons.arrow_upward,
                    size: 16,
                  ),
                  Text(maxTemperature.toString() + "°C"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
