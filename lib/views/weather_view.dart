import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_api/api/weather_api.dart';
import 'package:weather_api/constants/colors.dart';
import 'package:weather_api/modules/weather_model/weather_model.dart';
import 'package:weather_api/views/search.dart';

import '../controllers/weather_controller.dart';
import '../widget/row_widget.dart';
import '../widget/roweveryday.dart';
import '../widget/spacer_row.dart';
import '../widget/text_header.dart';

class WeatherView extends GetView<WeatherController> {
  WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kText,
        body: SafeArea(
          bottom: false,
          child: Obx(
            () {
              return controller.listDate.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.kBackgrounditem,
                      ),
                    )
                  : controller.isLonding(true)
                      ? WeatherWidget(controller: controller)
                      : Center(
                          child: CircularProgressIndicator(
                            color: AppColors.kBackgrounditem,
                          ),
                        );
            },
          ),
        ));
  }
}

class WeatherWidget extends StatelessWidget {
  WeatherWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WeatherController controller;
  final DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GetBuilder<WeatherController>(
          init: WeatherController(),
          builder: (_) => Stack(
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: heightScreen * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextHeaderWeather(
                          controller: controller, dateTime: dateTime),
                      IconButton(
                          onPressed: () {
                            Get.to(() => const SearchPage());
                          },
                          icon: Icon(
                            Icons.add,
                            size: 28,
                            color: AppColors.kBackgroundColor,
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: Image.asset(
                        controller.getImage(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightScreen * 0.05,
                  ),
                  // SizedBox(
                  //   height: heightScreen * 0.04,
                  // ),
                  RowWidget(controller: controller, widthScreen: widthScreen),
                ],
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.1,
                maxChildSize: 0.6,
                minChildSize: 0.1,
                builder: (context, scrollController) {
                  return Material(
                    clipBehavior: Clip.antiAlias,
                    shadowColor: Colors.black54,
                    elevation: 11,
                    color: AppColors.kBackgroundColor,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(25.0)),
                    child: ListView(
                      primary: false,
                      physics: const BouncingScrollPhysics(),
                      controller: scrollController,
                      padding:
                          const EdgeInsets.only(top: 18.0, left: 12, right: 12),
                      children: [
                        const SpacerWidget(),
                        Text(
                          '\nEvery day',
                          style:
                              TextStyle(fontSize: 18, color: AppColors.kText),
                        ),
                        SizedBox(
                          height: heightScreen * 0.04,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: RowEveryDayWidget(
                              controller: controller, index: 4),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: RowEveryDayWidget(
                              controller: controller, index: 9),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: RowEveryDayWidget(
                              controller: controller, index: 17),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: RowEveryDayWidget(
                              controller: controller, index: 25),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: RowEveryDayWidget(
                              controller: controller, index: 33),
                        ),
                        SizedBox(
                          height: heightScreen * 0.06,
                        ),
                        Divider(
                          color: AppColors.kText.withOpacity(0.5),
                          // height: 2,
                        ),
                        SizedBox(
                          height: heightScreen * 0.05,
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
