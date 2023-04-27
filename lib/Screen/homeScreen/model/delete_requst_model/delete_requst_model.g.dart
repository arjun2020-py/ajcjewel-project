// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_requst_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteRequstModel _$DeleteRequstModelFromJson(Map<String, dynamic> json) =>
    DeleteRequstModel(
      branchIds: (json['branchIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as int?,
    );

Map<String, dynamic> _$DeleteRequstModelToJson(DeleteRequstModel instance) =>
    <String, dynamic>{
      'branchIds': instance.branchIds,
      'status': instance.status,
    };
