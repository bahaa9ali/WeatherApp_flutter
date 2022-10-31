import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api/modules/weather_model/weather_model.dart';

class WeatherApi {
  String apiKey = "fb1c0d21de2ad227795f602741afd914";
  String beasUrl = "https://api.openweathermap.org/data/2.5";
  getWeatherOne(String city) async {
    final url = Uri.parse('$beasUrl/weather?q=$city&appid=$apiKey');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);

      return WeatherModel.fromJson(map);
    } else {
      throw Exception('Eroor,data found');
    }
  }
}
