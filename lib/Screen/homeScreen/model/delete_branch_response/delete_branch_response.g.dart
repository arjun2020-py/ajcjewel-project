// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_branch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteBranchResponse _$DeleteBranchResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteBranchResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeleteBranchResponseToJson(
        DeleteBranchResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
