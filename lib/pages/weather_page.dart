import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/models/weather_model.dart";
import 'package:flutter_application_1/services/weather_service.dart';
import "package:lottie/lottie.dart";

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
    //String cityName = await _weatherService.getCurrentCity();

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
  String getWeatherAnimation(String? mainCondition){
    if(mainCondition == null) return 'assets/Sunny.json';

    switch (mainCondition.toLowerCase()){
      case 'clouds':
        return 'assets/Cloudy.json';
      case 'mist':
        return 'assets/Wind.json';
      case 'haze':
        return 'assets/Wind.json';
      case 'smoke':
      case 'dust':
      case 'fog':
      case 'rain':
        return 'assets/Rainy.json';
      case 'drizzle':
      case 'clear':
        return 'assets/Sunny.json';
      case 'shower rain':
      case 'thunderstorm':
        default:
          return 'assets/Sunny.json';
    }
  }


  //initial state
  @override
  void initState(){
    super.initState();

    _fetchWeather();
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text(_weather?.cityName ?? "Loading City", style: const TextStyle(
          fontFamily: 'Pacifico', // Use a custom font
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),),
        
        Lottie.asset(getWeatherAnimation(_weather?.mainCondition), width: 200,
          height: 200,),
        Text('${_weather?.temprature.round()} ℃',style: const TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
        ),),
            Text(_weather?.mainCondition ?? "",
        style: const TextStyle(
          fontSize: 24,),),

      ],

        ),
      ),
    );
  }
}