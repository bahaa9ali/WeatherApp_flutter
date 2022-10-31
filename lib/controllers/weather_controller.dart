import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weather_api/api/weather_api.dart';
import 'package:weather_api/modules/model_forecast/model_forecast.dart';

import '../api/forecast.dart';
import '../modules/weather_model/weather_model.dart';

class WeatherController extends GetxController {
  RxList<WeatherModel> listDate = RxList<WeatherModel>();
  RxList<ModelForecast> listForecast = RxList<ModelForecast>();
  RxBool isLonding = RxBool(true);
  var nameCity = 'Baghdad';
  TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    getData();
    getForecast();
    super.onInit();
  }

  changeNameCity(String city) {
    nameCity = city;
    update();
  }

  getData() async {
    WeatherModel response = await WeatherApi().getWeatherOne(nameCity);

    listDate.add(response);

    isLonding(false);
  }

  getForecast() async {
    ModelForecast response = await ForecastApi().getForecast(nameCity);

    listForecast.add(response);
    // print('xxxxxxxxxxxxxxxxxxx');
    // print(response);

    isLonding(false);
  }

  String getImage() {
    switch (listDate[0].weather![0].main) {
      case "clear sky":
        return 'assets/images/icons/002.png';
      case "few clouds":
        return 'assets/images/icons/001.png';
      case "scattered clouds":
        return 'assets/images/icons/003.png';
      case "broken clouds":
        return 'assets/images/icons/003.png';
      case "shower rain":
        return 'assets/images/icons/005.png';
      case "rain":
        return 'assets/images/icons/004.png';
      case "thunderstorm":
        return 'assets/images/icons/005.png';

      default:
        return 'assets/images/icons/001.png';
    }
  }

  String getImageForecast(int i) {
    switch (listForecast[0].list![i].weather[0].main) {
      case "clear sky":
        return 'assets/images/icons/002.png';
      case "few clouds":
        return 'assets/images/icons/001.png';
      case "scattered clouds":
        return 'assets/images/icons/003.png';
      case "broken clouds":
        return 'assets/images/icons/003.png';
      case "shower rain":
        return 'assets/images/icons/005.png';
      case "rain":
        return 'assets/images/icons/004.png';
      case "thunderstorm":
        return 'assets/images/icons/005.png';

      default:
        return 'assets/images/icons/001.png';
    }
  }
}
