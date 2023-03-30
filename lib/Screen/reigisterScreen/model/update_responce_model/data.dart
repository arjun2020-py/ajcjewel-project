import 'package:json_annotation/json_annotation.dart';

import 'list_element.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'list')
  List<ListElement>? listElement;
  int? totalCount;

  Data({this.listElement, this.totalCount});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
