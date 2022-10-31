import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_api/constants/colors.dart';
import 'package:weather_api/controllers/weather_controller.dart';
import 'package:weather_api/views/weather_view.dart';

class SearchPage extends GetView<WeatherController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.kBackgroundColor,
            ),
            onPressed: (() {
              Get.back();
            })),
        title: Text(
          "Choose a city",
          style: TextStyle(
              color: AppColors.kBackgroundColor,
              //fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(18),
              child: TextField(
                controller: controller.textEditingController,
                cursorColor: AppColors.kBackgroundColor,
                decoration: InputDecorationMethod(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            ElevatedButton(
              onPressed: () {
                controller
                    .changeNameCity(controller.textEditingController.text);
                Get.to(() => WeatherView());
              },
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Colors.white,
                  fixedSize:
                      Size(MediaQuery.of(context).size.width * 0.90, 50)),
              child: Text(
                "Choose",
                style: TextStyle(
                    color: AppColors.kBackgroundColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration InputDecorationMethod() {
    return InputDecoration(
      hintText: "Search a new city...",
      // labelText: ,
      filled: true,
      prefixIcon: const Icon(
        Icons.search,
        // color: AppColors.kBackgroundColor,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
    );
  }
}
