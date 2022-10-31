import 'package:collection/collection.dart';

import 'city.dart';
import 'list.dart';

class ModelForecast {
  String? cod;
  int? message;
  int? cnt;
  List<dynamic>? list;
  City? city;

  ModelForecast({this.cod, this.message, this.cnt, this.list, this.city});

  ModelForecast.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <ListWeather>[];
      json['list'].forEach((v) {
        list!.add(ListWeather.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  // factory ModelForecast.fromJson(Map<String, dynamic> json) => ModelForecast(
  //       cod: json['cod'] as String?,
  //       message: json['message'] as int?,
  //       cnt: json['cnt'] as int?,
  //       list: (json['list']) ?.map((e) => (e as List<ListWeather>)
  //               .map((e) => ListWeather.fromJson(e as Map<String, dynamic>))
  //               .toList())
  //           .toList(),
  //       city: json['city'] == null
  //           ? null
  //           : City.fromJson(json['city'] as Map<String, dynamic>),
  //     );
}
