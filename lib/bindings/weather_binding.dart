import 'package:get/get.dart';

import '../controllers/weather_controller.dart';

class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WeatherController>(WeatherController(), permanent: true);
  }
}
