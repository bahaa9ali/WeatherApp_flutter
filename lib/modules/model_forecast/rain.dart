import 'package:collection/collection.dart';

class Rain {
  double? hores;

  Rain({this.hores});

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        hores: (json['h'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'h': hores,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Rain) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => hores.hashCode;
}
