import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../controllers/weather_controller.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key? key,
    required this.controller,
    required this.widthScreen,
  }) : super(key: key);

  final WeatherController controller;
  final double widthScreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${controller.listDate[0].weather![0].description}',
              style: GoogleFonts.tajawal(
                textStyle: const TextStyle(
                    color: Color.fromRGBO(159, 147, 255, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "${(controller.listDate[0].main!.temp! - 273.15).round().toString()} \u00B0 ",
              style: TextStyle(
                  color: AppColors.kBackgroundColor,
                  fontSize: 72,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.keyboard_arrow_up,
              size: 25,
              color: AppColors.kTextDateTime,
            ),
            Text(
              "${(controller.listDate[0].main!.tempMax! - 273.15).round().toString()} \u00B0 ",
              style: TextStyle(
                color: AppColors.kTextDateTime,
                fontSize: 14,
              ),
            ),
            SizedBox(
              width: widthScreen * 0.01,
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 25,
              color: AppColors.kTextDateTime,
            ),
            Text(
              "${(controller.listDate[0].main!.tempMin! - 273.15).round().toString()} \u00B0 ",
              style: TextStyle(
                color: AppColors.kTextDateTime,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
