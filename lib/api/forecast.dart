import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api/modules/model_forecast/model_forecast.dart';
import 'package:weather_api/modules/weather_model/weather_model.dart';

class ForecastApi {
  String apiKey = "fb1c0d21de2ad227795f602741afd914";
  String beasUrl = "https://api.openweathermap.org/data/2.5";
  getForecast(String city) async {
    final url = Uri.parse('$beasUrl/forecast?q=$city&appid=$apiKey');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);

      return ModelForecast.fromJson(map);
    } else {
      throw Exception('Eroor,data found');
    }
  }
}
