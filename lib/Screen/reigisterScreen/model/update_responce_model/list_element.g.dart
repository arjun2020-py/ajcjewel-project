// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListElement _$ListElementFromJson(Map<String, dynamic> json) => ListElement(
      id: json['_id'] as String?,
      name: json['_name'] as String?,
      uid: json['_uid'] as String?,
      email: json['_email'] as String?,
      mobile: json['_mobile'] as String?,
      tectCode: json['_tectCode'] as String?,
      globalGalleryId: json['_globalGalleryId'],
      dataGuard:
          (json['_dataGuard'] as List<dynamic>?)?.map((e) => e as int).toList(),
      createdUserId: json['_createdUserId'],
      createdAt: json['_createdAt'] as int?,
      updatedUserId: json['_updatedUserId'],
      updatedAt: json['_updatedAt'] as int?,
      status: json['_status'] as int?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$ListElementToJson(ListElement instance) =>
    <String, dynamic>{
      '_id': instance.id,
      '_name': instance.name,
      '_uid': instance.uid,
      '_email': instance.email,
      '_mobile': instance.mobile,
      '_tectCode': instance.tectCode,
      '_globalGalleryId': instance.globalGalleryId,
      '_dataGuard': instance.dataGuard,
      '_createdUserId': instance.createdUserId,
      '_createdAt': instance.createdAt,
      '_updatedUserId': instance.updatedUserId,
      '_updatedAt': instance.updatedAt,
      '_status': instance.status,
      '__v': instance.v,
    };
