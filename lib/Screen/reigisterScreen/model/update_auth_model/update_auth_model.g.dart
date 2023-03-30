// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAuthModel _$UpdateAuthModelFromJson(Map<String, dynamic> json) =>
    UpdateAuthModel(
      branchId: json['branchId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      textCode: json['textCode'] as String?,
      dataGuard:
          (json['dataGuard'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$UpdateAuthModelToJson(UpdateAuthModel instance) =>
    <String, dynamic>{
      'branchId': instance.branchId,
      'name': instance.name,
      'email': instance.email,
      'mobile': instance.mobile,
      'textCode': instance.textCode,
      'dataGuard': instance.dataGuard,
    };
