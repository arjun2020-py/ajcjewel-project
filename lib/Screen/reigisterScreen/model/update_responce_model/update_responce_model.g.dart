// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateResponceModel _$UpdateResponceModelFromJson(Map<String, dynamic> json) =>
    UpdateResponceModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateResponceModelToJson(
        UpdateResponceModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
