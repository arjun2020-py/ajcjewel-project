// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserResponseModel _$UpdateUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdateUserResponseModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateUserResponseModelToJson(
        UpdateUserResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
