import 'package:flutter/material.dart';
import 'package:weather_api/data_services.dart';
import 'package:weather_api/model.dart';

class AllowAccess extends StatefulWidget {
  const AllowAccess({Key? key}) : super(key: key);

  @override
  State<AllowAccess> createState() => _AllowAccessState();
}

class _AllowAccessState extends State<AllowAccess> {
  final _cityTextController = TextEditingController();
  final _dataService = DataServices();
  WeatherResponse? _response;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('images/assets/bg1.jpg')),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_response != null)
                Column(
                  children: [
                    Image.network(_response!.iconUrl, scale: 0.5),
                    Text(
                      '${_response!.tempInfo.temprature}◦',
                      style: const TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    Text(
                      _response!.weatherInfo.description,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
              SizedBox(
                width: 150,
                child: TextField(
                  controller: _cityTextController,
                  decoration: const InputDecoration(
                      labelText: 'Search City',
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(onPressed: _search, child: const Text('Search'))
            ],
          ),
        ),
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
    // _cityTextController.clear();
  }
}
