/*
                          
  {
 
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  
  "main": {
    "temp": 282.55,
    "feels_like": 281.86,
    "temp_min": 280.37,
    "temp_max": 284.26,
    "pressure": 1023,
    "humidity": 100
  },
  
  
  "name": "Mountain View",
  "cod": 200
  }                                                 
*/
class WeatherInfo {
  final String description;
  final String icon;
  WeatherInfo({required this.description, required this.icon});
  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class TempratureInfo {
  final double temprature;
  TempratureInfo({required this.temprature});

  factory TempratureInfo.fromJson(Map<String, dynamic> json) {
    final temprature = json['temp'];
    return TempratureInfo(temprature: temprature);
  }
}

class WeatherResponse {
  final String cityName;
  final TempratureInfo tempInfo;
  final WeatherInfo weatherInfo;

  String get iconUrl {
    return 'http://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse(
      {required this.cityName,
      required this.tempInfo,
      required this.weatherInfo});

  factory WeatherResponse.formJson(Map<String, dynamic> json) {
    final tempInfoJson = json['main'];
    final tempInfo = TempratureInfo.fromJson(tempInfoJson);

    final cityName = json['name'];

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);
    return WeatherResponse(
        cityName: cityName, tempInfo: tempInfo, weatherInfo: weatherInfo);
  }
}
