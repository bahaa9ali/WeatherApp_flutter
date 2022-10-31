import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_api/constants/colors.dart';

import '../controllers/weather_controller.dart';

class TextHeaderWeather extends StatelessWidget {
  const TextHeaderWeather({
    Key? key,
    required this.controller,
    required this.dateTime,
  }) : super(key: key);

  final WeatherController controller;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: '${controller.listDate[0].name}\n\n',
              style: GoogleFonts.tajawal(
                textStyle: TextStyle(
                    color: AppColors.kBackgroundColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
          TextSpan(
            text: DateFormat('yMMMMd').format(dateTime),
            style: TextStyle(
                color: AppColors.kTextDateTime,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
