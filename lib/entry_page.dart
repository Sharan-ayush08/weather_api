// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_api/front_page.dart';

// ignore: camel_case_types
class Front_ extends StatefulWidget {
  const Front_({Key? key}) : super(key: key);

  @override
  _Front_State createState() => _Front_State();
}

// ignore: camel_case_types
class _Front_State extends State<Front_> {
  @override
  void initState() {
    super.initState();
    // getCurrentLocation();
    determinePosition();
  }

  // void getCurrentLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.low);
  //   print(position);
  // }

  Future<Position?> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      throw Exception('Error');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "images/assets/bg.jpg",
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to the Clima App",
                style: GoogleFonts.pacifico(
                    textStyle:
                        const TextStyle(fontSize: 25, color: Colors.white))),
            ElevatedButton(
                onPressed: () {
                  determinePosition();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AllowAccess()));
                },
                child: const Text("Allow Access"))
          ],
        ),
      ),
    );
  }
}
