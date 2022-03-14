import 'package:flutter/material.dart';
import 'package:weather_api/data_services.dart';
// import 'package:weather_api/model.dart';
import 'package:weather_api/models/model.dart';

class AllowAccess extends StatefulWidget {
  const AllowAccess({Key? key}) : super(key: key);

  @override
  State<AllowAccess> createState() => _AllowAccessState();
}

class _AllowAccessState extends State<AllowAccess> {
  final _cityTextController = TextEditingController();
  final _dataService = DataServices();
  WeatherResponse? _response;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int temprature = 0;
  String location = "Mumbai";

  void validate() {
    if (formKey.currentState!.validate()) {
      print("Validated");
    } else {
      print("Not Validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('images/assets/clear.png')),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_response != null)
                      Column(
                        children: [
                          Image.network(_response!.iconUrl, scale: 0.5),
                          Text(
                            '${_response!.tempInfo.temprature.round()}℃',
                            style: const TextStyle(
                                fontSize: 40, color: Colors.white),
                          ),
                          Text(
                            _response!.weatherInfo.description,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
                    SizedBox(
                      width: 280,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required';
                          } else {
                            return null;
                          }
                        },
                        controller: _cityTextController,
                        decoration: InputDecoration(
                            labelText: 'Search City',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0))),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                        onPressed: () {
                          _search;
                          validate();
                        },
                        child: const Text('Search'))
                  ],
                ),
              ),
            ),
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
