// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:weather_api/screens/location_access.dart';
import 'package:weather_api/screens/weather_search.dart';
import 'package:weather_api/screens/settings.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
      initialRoute: "/second",
      routes: {
        "/second": (context) => const Front_(),
        "/first": (context) => const AllowAccess(),
      },
      debugShowCheckedModeBanner: false,
      home: const DataMapping()));
}

class DataMapping extends StatefulWidget {
  const DataMapping({Key? key}) : super(key: key);

  @override
  _DataMappingState createState() => _DataMappingState();
}

class _DataMappingState extends State<DataMapping> {
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Settings()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 179, 192, 197),
          title: const Text(""),
          actions: [
            PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("Settings"),
                ),
              ],
            )
          ],
        ),
        body: Column(
          children: const [Front_(), AllowAccess()],
        ));
  }
}
