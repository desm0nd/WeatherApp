//import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/pages/weather_page.dart";

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333333),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF999999),
        elevation: 0,
        title: const Text('Weather App',
          style: TextStyle(
            fontFamily: 'Pacific',
            fontSize: 40,
          ),),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WeatherPage()),);
          }, child: const Text('Fetch Current Weather'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            // backgroundGradient: LinearGradient(
            //   colors: [Colors.blue, Colors.lightBlue],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
            minimumSize: const Size(200, 70),
            elevation: 4,
          ),
        ),
      ),
    );
  }
}
