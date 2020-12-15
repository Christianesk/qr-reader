import 'package:meta/meta.dart';

class ScanModel {
    ScanModel({
        this.id,
        this.type,
        @required this.value,
    }){

      if (this.value.contains('http')) {
        this.type = 'type';
      } else {
        this.type = 'geo';
      }
    }

    int id;
    String type;
    String value;

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "value": value,
    };
}
