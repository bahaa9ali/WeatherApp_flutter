import 'package:get/get.dart';

import '../bindings/weather_binding.dart';
import '../views/weather_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const inittal = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => WeatherView(),
      binding: WeatherBinding(),
    ),
  ];
}
