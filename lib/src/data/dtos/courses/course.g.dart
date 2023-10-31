// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDto _$CourseDtoFromJson(Map<String, dynamic> json) => CourseDto(
      json['_id'] as String,
      json['stt'] as int,
      json['code'] as String,
      json['title'] as String,
      json['description'] as String,
      json['vi_title'] as String,
      json['vi_description'] as String,
      json['outcome'] as String,
      json['image'] as String,
      json['public_status'] as String,
      json['active_language'] as String,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['isData'] as bool,
    );

Map<String, dynamic> _$CourseDtoToJson(CourseDto instance) => <String, dynamic>{
      '_id': instance.id,
      'stt': instance.stt,
      'code': instance.code,
      'title': instance.title,
      'description': instance.description,
      'vi_title': instance.vi_title,
      'vi_description': instance.vi_description,
      'outcome': instance.outcome,
      'image': instance.image,
      'public_status': instance.public_status,
      'active_language': instance.active_language,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isData': instance.isData,
    };
