import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter_application_1/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService{
  static const BASE_URL = "https://api.openweathermap.org/data/2.5/weather";
  final String apikey;

  WeatherService(this.apikey);
  
  Future<Weather> getWeather( ) async {

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }

    //fetch current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );


    final response = await http.get(Uri.parse('$BASE_URL?lat=$position.Latitude&lon=$position.Longitude&appid=$apikey&units=metric'));
    if (kDebugMode) {
      print("response");
      print(response);
    }

    if ( response.statusCode == 200 ){
      return Weather.fromJSON(jsonDecode(response.body));
    }
    else{
      throw Exception('Failed to load weather data');
    }
   }
  
  Future<String> getCurrentCity() async {

    //get permission from user
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }
    if (kDebugMode) {
      print(permission);
    }

    //fetch current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
    if (kDebugMode) {
      print(position);
    }

    //convert location into list of placemeark objects
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if (kDebugMode) {
      print(placemarks[0].locality);
    }

    //extract cityname
    String? city = placemarks[0].locality;

    return city ?? "";
  }
 

}