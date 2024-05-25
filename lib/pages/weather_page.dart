import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/models/weather_model.dart";
import 'package:flutter_application_1/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage>{

  //api key
  final _weatherService = WeatherService('98abbcf38daa50b344ccc0eed7defcc2');
  Weather? _weather;


  //fetch weather
  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try{
      final weather = await _weatherService.getWeather();
      setState(() {
        _weather = weather;
      });
    }
    catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
  }




  //weather animation


  //initial state
  @override
  void initState(){
    super.initState();

    _fetchWeather();
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text(_weather?.cityName ?? "Loading City"),
        Text('${_weather?.temprature.round()}degree celcius'),  
      ],

        ),
      ),
    );
  }
}