import 'package:flutter/material.dart';
import 'package:live_climate/model/get_location_permission.dart';
import 'package:live_climate/model/get_weather_data.dart';
import 'package:live_climate/screen/home/homepage.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  GetWeatherData getWeatherData = GetWeatherData();

  @override
  void initState() {
    super.initState();
    getGPSLocation();
  }

  getGPSLocation() async {
    GetLocation location = GetLocation();
    await location.getCurrentLocation();
    getData(location);
  }

  getData(GetLocation location) async {
    var weatherData = await getWeatherData.getWeatherData(location);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  weatherData: weatherData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
