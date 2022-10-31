import 'package:collection/collection.dart';

class Sys {
  String? pod;

  Sys({this.pod});

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: json['pod'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'pod': pod,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Sys) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => pod.hashCode;
}
