import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    String? cityName;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: TextField(
              onChanged: (value) {
                cityName = value;
              },
              decoration: const InputDecoration(
                filled: true,
                hintText: "Enter City Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (cityName != null) {
                Navigator.pop(context, cityName);
              } else if (cityName == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please enter city name"),
                  ),
                );
              }
            },
            child: const Text("Get Weather"),
          ),
        ],
      ),
    );
  }
}
