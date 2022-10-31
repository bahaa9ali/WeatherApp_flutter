import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_api/constants/colors.dart';

import '../controllers/weather_controller.dart';

class RowEveryDayWidget extends StatelessWidget {
  const RowEveryDayWidget({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final WeatherController controller;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormat('yMMMMd').format(
              DateTime.parse(controller.listForecast[0].list![index].dtTxt)),
          style: TextStyle(
            color: AppColors.kText.withOpacity(0.9),
            fontSize: 18,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Text(
          "${(controller.listForecast[0].list![index].main.tempMax - 273.15).round().toString()} \u00B0   ",
          style: TextStyle(
              color: AppColors.kText,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        Text(
          "${(controller.listForecast[0].list![index].main.tempMin - 273.15).round().toString()} \u00B0   ",
          style: TextStyle(
              color: AppColors.kText.withOpacity(0.7),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 30,
          height: 30,
          child: Image.asset(
            controller.getImageForecast(index),
          ),
        ),
      ],
    );
  }
}
