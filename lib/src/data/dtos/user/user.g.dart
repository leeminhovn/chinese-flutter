// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      json['_id'] as String,
      json['name'] as String,
      json['email'] as String,
      json['expired_day'] as String?,
      json['avatar'] as String,
      json['createdAt'] as String,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'expired_day': instance.expired_day,
      'avatar': instance.avatar,
      'createdAt': instance.createdAt,
    };

TokensDto _$TokensDtoFromJson(Map<String, dynamic> json) => TokensDto(
      json['accessToken'] as String,
      json['exp__accessToken'] as int,
      json['refreshToken'] as String,
      json['exp__refreshToken'] as int,
    );

Map<String, dynamic> _$TokensDtoToJson(TokensDto instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'exp__accessToken': instance.exp__accessToken,
      'refreshToken': instance.refreshToken,
      'exp__refreshToken': instance.exp__refreshToken,
    };
