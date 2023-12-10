// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      json['name'] as String,
      json['email'] as String,
      json['expired_day'] as String?,
      json['createdAt'] as String,
      json['tokens'] == null
          ? null
          : TokensDto.fromJson(json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'expired_day': instance.expired_day,
      'createdAt': instance.createdAt,
      'tokens': instance.tokens,
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
