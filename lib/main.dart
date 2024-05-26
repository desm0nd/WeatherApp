import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/start_page.dart';
//import 'package:flutter_application_1/pages/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),

    );
  }
}