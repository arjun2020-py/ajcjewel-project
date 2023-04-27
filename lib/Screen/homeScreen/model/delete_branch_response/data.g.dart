// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      acknowledged: json['acknowledged'] as bool?,
      modifiedCount: json['modifiedCount'] as int?,
      upsertedId: json['upsertedId'],
      upsertedCount: json['upsertedCount'] as int?,
      matchedCount: json['matchedCount'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'acknowledged': instance.acknowledged,
      'modifiedCount': instance.modifiedCount,
      'upsertedId': instance.upsertedId,
      'upsertedCount': instance.upsertedCount,
      'matchedCount': instance.matchedCount,
    };
