import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';

import 'routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      builder: (context) => const WeatherApp(), // Wrap your app
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      title: "WEATHER API",
      initialRoute: AppPages.inittal,
      getPages: AppPages.routes,
    );
  }
}
