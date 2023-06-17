import 'dart:convert';
import 'package:clima/constants.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/utilities/get_weather.dart';


class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key,required this.weatherData});

  final dynamic weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  late String emoji;
  late String message;
  late String temperature;
  
  @override
  void initState() {
    super.initState();
    
    temperature = widget.weatherData['main']['temp'].round().toString();
    emoji =  WeatherModel().getWeatherIcon(widget.weatherData['main']['temp'].round());
    message = '${WeatherModel().getMessage(widget.weatherData['main']['temp'].round())} in ${widget.weatherData['name']}!';
  }
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        temperature = widget.weatherData['main']['temp'].round().toString();
                        emoji =  WeatherModel().getWeatherIcon(widget.weatherData['main']['temp'].round());
                        message = '${WeatherModel().getMessage(widget.weatherData['main']['temp'].round())} in ${widget.weatherData['name']}!';
                      });
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var cityName = await Navigator.push(context, MaterialPageRoute(builder: (context) => const CityScreen()));
                      GetWeatherData weatherData = GetWeatherData(url: 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$kApiKey&units=metric');
                      var result = await weatherData.getWeatherData();
                      result = jsonDecode(result);
                      setState(() {
                        temperature = result['main']['temp'].round().toString();
                        emoji =  WeatherModel().getWeatherIcon(result['main']['temp'].round());
                        message = '${WeatherModel().getMessage(result['main']['temp'].round())} in ${result['name']}!';
                      });
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                      color : Colors.white
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "$temperature°",
                      style: kTempTextStyle,
                    ),
                    Text(
                      emoji,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                    message,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
