import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/get_location.dart';
import 'package:clima/utilities/get_weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/constants.dart';
import 'dart:convert';



class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  late double lat;
  late double long;

  void getLocation() async {
    GetLocationData location = GetLocationData();
    var position = await location.determinePosition();
    lat = position[1];
    long = position[0];
    GetWeatherData weatherData = GetWeatherData(url: 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$kApiKey&units=metric');
    var result = await weatherData.getWeatherData();
    result = jsonDecode(result);
    Navigator.push(context, MaterialPageRoute(
          builder: (context) => LocationScreen(
            weatherData: result,
          ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitPouringHourGlassRefined(
              color: Colors.white54,
            size: 50.0,
          )
        ],
      ),
    );
  }
}
