// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api/models/model.dart';

class DataServices {
  Future<WeatherResponse> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    final queryParmameter = {
      'q': city,
      'appid': '98e8dfcf4ea2319b693eb4c58b2a6018',
      'units': 'imperial'
    };
    final url = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParmameter);

    final response = await http.get(url);
    print(response.body);

    final json = jsonDecode(response.body);
    return WeatherResponse.formJson(json);
  }
}
